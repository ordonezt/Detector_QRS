# -*- coding: utf-8 -*-
"""
Created on Fri Mar 18 09:57:20 2022

Comentario importante: tratar de hacer el codigo del algoritmo lo mas parecido a C
asi el pasaje al micro es facil
@author: tomaso
"""
import matplotlib.pyplot as plt
import interfaz_memoria_python as m2p
from utils import filtrar, importar_filtro, escalar_senial, \
declinacion_hiperbolica, importar_senial_octave, agregar_y_desplazar, promedio
import numpy as np
from scipy.fft import fft, fftfreq
from scipy.signal import bode
import mplcursors
from scipy.signal import filtfilt, lfilter


def tiempo2muestras(tiempo, fs):
    return tiempo * fs

senial_path = 'Signals_ADS/N_sinus_360ppm_1mV'
senial_micro_path = 'Signals_ADS/qrs_1mV'
senial_umbral_path = 'Signals_ADS/R_wave_60ppm_05mV_80ms_umbral'
filtro_qrs_path = 'Filtros/Filtro_diferenciador_QRS_BESSEL_2_IIR.csv'
filtro_pasa_altos_path = 'Filtros/Filtro_diferenciador_QRS_IIR.csv'
filtro_notch_path = 0

#Definicion de parametros
FS = 500
TAMANIO_BLOQUE_FILTRADO = 5
UMBRAL_MINIMO = 0#5000#50#1e-6
GANANCIA_ADS = 1
CTE_HIPERBOLICA = 0.012#0.024#0.006
PERIODO_REFRACTARIO     = int(140e-3 * FS)
PERIODO_VALIDACION      = int(16e-3 * FS)
PERIODO_BUSQUEDA_MAX    = int(50e-3 * FS)
CANT_PROMEDIOS = 10
PERIODO_BUSQUEDA_UMBRAL_MINIMO = int(1 * FS)

#Variables globales
maximo = 0
maximo_local = 0
umbral = UMBRAL_MINIMO
ganancia = 1
muestras_desde_contacto = 0
indice_global = 0           #Tiene el numero de muestra actual sobre el total
indice_maximo_local = 0
deteccion_bloqueada = 50
contador_muestras_validas = 0
intervalo_entre_pulsos = 0
vector_integral = []
muestras_desde_maximo = 0
buscando_maximo_flag = False
contador_muestras_maximo = 0

dato_anterior = None

x0 = 0
x1 = 0
x2 = 0

u0 = u1 = u2 = 0

maximo_local_anterior = 0
contador_maximo_local = 0

#Maquina de estados
ESTADO_RESET        = 0
ESTADO_BUSCANDO     = 1
ESTADO_ANALIZANDO   = 2
ESTADO_BLOQUEADO    = 3
estado = ESTADO_RESET

#Contadores
contador_tiempo_reset       = 0
contador_umbral_superior    = 0
contador_umbral_inferior    = 0
contador_buscando_maximo    = 0

#Umbrales
umbral_superior     = 0
umbral_inferior     = 0
acumulador_ruido    = 0
contador_ruido      = 0
umbral_minimo       = 0
busqueda_umbral_minimo = PERIODO_BUSQUEDA_UMBRAL_MINIMO
ATENUACION_UMBRAL_INFERIOR = 0.3


#Señales auxiliares
senial_filtrada_final = []
senial_cuadrada_final = []
senial_integrada_final = []
senial_umbral = []
senial_maximo = []
senial_bloqueo = []
senial_umbral_minimo = []
senial_maximo_local = []
senial_umbral_superior = []
senial_umbral_inferior = []
senial_contador_ruido = []

#Flags
marcapasos_flag = False
latiguillos_flag = False
insto_flag = False

#Importamos los filtros usados
#Filtro derivador y pasa bajos (pasa banda)
filtro, b, a = importar_filtro(filtro_qrs_path)
N_etapas = filtro.shape[0]
#Condiciones iniciales y finales del filtro de QRS
zi = np.zeros((N_etapas,2))

#Filtro pasa altos
filtro_hp, b_hp, a_hp = importar_filtro(filtro_pasa_altos_path)
N_etapas_hp = filtro.shape[0]
zi_hp = np.zeros((1,2))

#Importar una señal
senial_entrada = m2p.memoria2array_int16(senial_path)
senial_micro = m2p.memoria2array_float32(senial_micro_path)
senial_umbral_micro = m2p.memoria2array_float32(senial_umbral_path)
#senial_entrada = importar_senial_octave(senial_path)

senial_entrada = senial_entrada[65:] - np.average(senial_entrada)

# senial_filtrada = filtrar(senial_entrada, filtro)
#senial_filtrada = senial_filtrada * senial_filtrada
# fig0, [ax0, ax1] = plt.subplots(2,1)
# ax0.plot(senial_entrada, label='entrada')
# ax0.plot(senial_filtrada, label='salida')
# ax0.legend()

#Filtrarla
# #Sacamos la continua
# senial_filtrada_offline = filtfilt(b_hp, a_hp, senial_entrada)
# #Convertimos a entero, como esta en el micro
# senial_filtrada_offline = senial_filtrada_offline.astype(int)
# #Amplificamos
# senial_filtrada_offline = 10 * senial_filtrada_offline
senial_filtrada_offline = senial_entrada
#Derivamos y sacamos ruido
senial_filtrada_offline = lfilter(b, a, senial_filtrada_offline)
#Convertimos a entero, como esta en el micro
senial_filtrada_offline = senial_filtrada_offline.astype(int)
senial_filtrada_offline = senial_filtrada_offline ** 2


longitud_total = len(senial_entrada)

#Ruido
#ruido = np.random.normal(0, 5, longitud_total)
ruido = 0

senial_entrada = senial_entrada + ruido

#Creo un vector de eventos de pulsos
vector_pulsos = np.zeros(longitud_total)
vector_maximos = np.zeros(longitud_total)

vector_buscando_maximo = np.zeros(longitud_total)

#Indice para retirar bloques de señal
indice_extraccion = 0
while indice_extraccion < (longitud_total - TAMANIO_BLOQUE_FILTRADO):
    
    #Extraigo un bloque de señal
    tramo_senial = senial_entrada[indice_extraccion : indice_extraccion + TAMANIO_BLOQUE_FILTRADO]
    indice_extraccion = indice_extraccion + TAMANIO_BLOQUE_FILTRADO
        
    #Si estoy en condiciones de analizar sigo, si no descarto
    #Marcapasos, latiguillos sueltos, insto
    if marcapasos_flag or latiguillos_flag or insto_flag:
        #Descartar tramo
        indice_global = indice_global + TAMANIO_BLOQUE_FILTRADO
        deteccion_bloqueada = deteccion_bloqueada - TAMANIO_BLOQUE_FILTRADO
        if deteccion_bloqueada < 0:
            deteccion_bloqueada = 0
    else:
        if indice_global == 300:
            maximo = 0
            umbral = UMBRAL_MINIMO
            contador_muestras_validas = 0
            umbral_minimo = 0
            
        #Filtrarla
        # #Sacamos la continua
        # senial_filtrada, zi_hp = filtrar(tramo_senial, filtro_hp, zi_hp)
        # #Convertimos a entero, como esta en el micro
        # senial_filtrada = senial_filtrada.astype(int)
        senial_filtrada = tramo_senial
        # #Amplificamos
        # senial_filtrada = 10 * senial_filtrada
        #Derivamos y sacamos ruido
        senial_filtrada, zi = filtrar(senial_filtrada, filtro, zi)
        #Convertimos a entero, como esta en el micro
        senial_filtrada = senial_filtrada.astype(int)
        senial_filtrada_final = np.append(senial_filtrada_final, senial_filtrada)
        
        for i in range(TAMANIO_BLOQUE_FILTRADO):
            #Extraemos un dato
            u0 = escalar_senial(senial_filtrada[i], ganancia, GANANCIA_ADS)
            
            x0 = u0 - u2
            u2 = u1
            u1 = u0
            
            y = x0 * x1 * x2
            if y < 0:
                y = 0
            x2 = x1
            x1 = x0
            
            senial_cuadrada_final = np.append(senial_cuadrada_final, y)
            
            if indice_global == 200:
                estado = ESTADO_RESET
                acumulador_ruido = 0
                contador_ruido = 0
                contador_tiempo_reset = 0
            
            if estado == ESTADO_RESET:
                contador_tiempo_reset = contador_tiempo_reset + 1
                if contador_tiempo_reset > tiempo2muestras(1, FS):
                    contador_tiempo_reset = 0
                    estado = ESTADO_BUSCANDO
                    # print(indice_global)
                
                acumulador_ruido = acumulador_ruido + y
                contador_ruido = contador_ruido + 1
                umbral_minimo = 1.3 * acumulador_ruido / contador_ruido

                    
            elif estado == ESTADO_BUSCANDO:
                estado = ESTADO_BUSCANDO
                
                acumulador_ruido = acumulador_ruido + y
                contador_ruido = contador_ruido + 1
                
                if y > umbral_inferior:
                    contador_umbral_inferior = contador_umbral_inferior + 1
                    if y > maximo_local:
                        maximo_local = y
                        indice_maximo_local = indice_global
                elif contador_umbral_inferior > 0:
                    contador_umbral_inferior = contador_umbral_inferior - 1
                else:
                    maximo_local = 0
                    
                if y > umbral_superior:
                    contador_umbral_superior = contador_umbral_superior + 1
                elif contador_umbral_superior > 0:
                    contador_umbral_superior = contador_umbral_superior - 1
                
                if contador_umbral_inferior > PERIODO_VALIDACION:
                    if contador_umbral_superior > 0:
                        #Pulso valido
                        #Cambiamos de estado avisando que sigue un periodo refractario
                        estado = ESTADO_BLOQUEADO
                        flag_periodo_refractario = True
                        deteccion_bloqueada = PERIODO_REFRACTARIO
                        #Definimos el tiempo para buscar el maximo
                        contador_buscando_maximo = PERIODO_BUSQUEDA_MAX
                        #Calculamos el umbral minimo
                        umbral_minimo = 1.3 * acumulador_ruido / contador_ruido# + umbral_inferior / 2
                        acumulador_ruido = 0
                        contador_ruido = 0
                        vector_pulsos[indice_global] = senial_entrada[indice_global]
                        print("maximo local {}".format(maximo_local))
                        
                    
            elif estado == ESTADO_ANALIZANDO:
                estado = ESTADO_ANALIZANDO
                
            elif estado == ESTADO_BLOQUEADO:
                if flag_periodo_refractario == True:
                    if contador_buscando_maximo > 0:
                        if y > maximo_local:
                            maximo_local = y
                            indice_maximo_local = indice_global
                        
                        contador_buscando_maximo = contador_buscando_maximo - 1
                        if contador_buscando_maximo == 0:
                            print("maximo local {}".format(maximo_local))
                            print("Busqueda terminada")
                            maximo = maximo_local
                            maximo_local = 0
                            muestras_desde_contacto = indice_global - indice_maximo_local
                
                if deteccion_bloqueada > 0:
                    deteccion_bloqueada = deteccion_bloqueada - 1
                    if deteccion_bloqueada == 0:
                        if flag_periodo_refractario == True:
                            flag_periodo_refractario = False
                            estado = ESTADO_BUSCANDO
                            
              
            #Esto se ejecuta en todos los estados:
            muestras_desde_contacto = muestras_desde_contacto + 1
            
            #Recalculamos el umbral superior
            umbral_superior = declinacion_hiperbolica(maximo, CTE_HIPERBOLICA, muestras_desde_contacto)
            if umbral_superior < umbral_minimo:
                umbral_superior = umbral_minimo
            
            #Recalculamos el umbral inferior
            umbral_inferior = ATENUACION_UMBRAL_INFERIOR * umbral_superior
            if umbral_inferior < umbral_minimo:
                umbral_inferior = umbral_minimo
                
            #Incrementamos el tiempo total
            indice_global = indice_global + 1
            
            #Señales
            senial_umbral_superior = np.append(senial_umbral_superior, umbral_superior)
            senial_umbral_inferior = np.append(senial_umbral_inferior, umbral_inferior)
            senial_maximo = np.append(senial_maximo, maximo)
            senial_bloqueo = np.append(senial_bloqueo, -1 * deteccion_bloqueada)
            senial_umbral_minimo.append(umbral_minimo)
            senial_maximo_local = np.append(senial_maximo_local, maximo_local)
            senial_contador_ruido = np.append(senial_contador_ruido, (contador_ruido!=0) * 1000)
            
            # print(estado)


senial_filtrada = filtrar(senial_entrada, filtro)
# senial_filtrada_offline[0:350] = senial_integrada_final[0:350] = senial_umbral[0:350] = 0
fig0, [ax0, ax1] = plt.subplots(2,1)
# ax0.plot(senial_entrada, label='entrada')
ax1.plot(senial_entrada, label='entrada')
# ax0.plot(senial_filtrada_final, label='filtrada')
ax0.plot(senial_cuadrada_final, label='cuadrada')
ax0.plot(senial_bloqueo, label='bloqueo')
# ax0.plot(senial_umbral_superior, label='umbral superior')
# ax0.plot(senial_umbral_inferior, label='umbral inferior')
ax0.plot(senial_umbral_minimo, label='umbral minimo')
# ax0.plot(senial_maximo, label='maximo')
# ax0.plot(senial_maximo_local, label='maximo local')
# ax0.plot(senial_filtrada_offline, label='offline')
# ax0.plot(senial_integrada_final, label='integrada')
# ax0.stem(vector_maximos, label='maximos', markerfmt='-')
ax0.stem(vector_pulsos, label='pulsos', markerfmt='-')
# ax0.plot(senial_micro, label='micro')
# ax0.plot(senial_umbral_micro, label='umbral micro')
# ax0.plot(vector_buscando_maximo, label='buscando')
ax1.stem(vector_pulsos, label='pulsos', markerfmt='-')
ax0.plot(senial_contador_ruido, label='contador ruido')

fft_original = fft(senial_entrada)
fft_original[0] = 0+0j
N = len(senial_entrada)
freq = fftfreq(N, 1/FS)[:N//2]
w, mag, phase = bode((b, a), w=freq)

# ax2.plot(freq, 2.0/N * np.abs(fft_original[0:N//2]), label='entrada')
# ax2.plot(w, mag, label='filtro')

fig0.suptitle(senial_path.split(sep='/')[-1] + '\n' + filtro_qrs_path.split(sep='/')[-1])
ax0.legend()
ax1.legend()
# ax2.legend()

ax0.set_title('Procesamiento')
ax1.set_title('Resultados')
# ax2.set_title('Espectro')

ax0.grid(True)
ax1.grid(True)
# ax2.grid(True)

mplcursors.cursor()

plt.show()
