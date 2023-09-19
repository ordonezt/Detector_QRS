# -*- coding: utf-8 -*-
"""
Created on Thu Feb  9 15:10:32 2023

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

senial_path         = 'Signals_ADS/ADS1292RandADS1198/filtrada_60ppm_2mV_10ms_micro_ads1198_5'
senial_micro_path   = 'Signals_ADS/ADS1292RandADS1198/procesada_250bpm_5mV_40ms_2'
senial_umbral_path  = 'Signals_ADS/ADS1292RandADS1198/umbral_minimo_250bpm_5mV_40ms_2'
filtro_qrs_path = 'Filtros/Filtro_diferenciador_QRS_BESSEL_2_IIR.csv'
filtro_pasa_altos_path = 'Filtros/Filtro_diferenciador_QRS_IIR.csv'
filtro_notch_path = 'Filtros/Notch_50Hz_IIR.csv'

#Definicion de parametros
FS = 500
TAMANIO_BLOQUE_FILTRADO = 5
UMBRAL_MINIMO = 0#5000#50#1e-6
GANANCIA_ADS = 1
CTE_HIPERBOLICA = 0.024#0.024#0.006
PERIODO_REFRACTARIO = int(130e-3 * FS)
PERIODO_VALIDACION = int(16e-3 * FS)
PERIODO_BUSQUEDA = int(50e-3 * FS)
CANT_PROMEDIOS = 10
PERIODO_BUSQUEDA_UMBRAL_MINIMO = int(1 * FS)
PROP_UMBRAL_INFERIOR = 0.3

PERIODO_RESET = int(1 * FS)
PERIODO_VALIDACION_UI = int(16e-3 * FS)
PERIODO_VALIDACION_US = int(0 * FS)

QRS_RESET       = 0
QRS_BUSCANDO    = 1
QRS_BLOQUEADO   = 2

#Variables globales
maximo = 0
maximo_local = 0
umbral_superior = UMBRAL_MINIMO
umbral_inferior = UMBRAL_MINIMO
ganancia = 1
muestras_desde_contacto = 0
indice_global = 0           #Tiene el numero de muestra actual sobre el total
indice_maximo_local = 0
deteccion_bloqueada = 50
contador_muestras_validas = 0
intervalo_entre_pulsos = 0
vector_integral = []
muestras_desde_maximo = 0
muestras_desde_maximo_local = 0
buscando_maximo_flag = False
contador_muestras_maximo = 0
estado = QRS_RESET
dato_anterior = None
contador_tiempo_reset = 0
muestras_deteccion_bloqueada = 0
contador_umbral_inferior = 0
contador_umbral_superior = 0

x0 = 0
x1 = 0
x2 = 0

u0 = u1 = u2 = 0

maximo_local_anterior = 0
contador_maximo_local = 0

#Variables para calcular el umbral minimo en base al ruido
CTE_UMBRAL_MINIMO = 1.1
contador_buscando_maximo = 0
acumulador_ruido = 0
contador_ruido = 0
umbral_minimo = 0
busqueda_umbral_minimo = PERIODO_BUSQUEDA_UMBRAL_MINIMO

#Señales auxiliares
senial_filtrada_final = []
senial_procesada_final = []
senial_integrada_final = []
senial_umbral_superior = []
senial_umbral_inferior = []
senial_maximo = []
senial_bloqueo = []
senial_umbral_minimo = []
senial_maximo_local = []

#Flags
marcapasos_flag = False
latiguillos_flag = False
insto_flag = False
flag_periodo_refractario = False

#Importamos los filtros usados
#Filtro derivador y pasa bajos (pasa banda)
filtro, b, a = importar_filtro(filtro_qrs_path)
b = np.float32(b)
filtro = np.float32(filtro)
N_etapas = filtro.shape[0]
#Condiciones iniciales y finales del filtro de QRS
zi = np.zeros((N_etapas,2))

#Filtro pasa altos
filtro_hp, b_hp, a_hp = importar_filtro(filtro_pasa_altos_path)
N_etapas_hp = filtro.shape[0]
zi_hp = np.zeros((1,2))

#Filtro notch
filtro_notch, b_notch, a_notch = importar_filtro(filtro_notch_path)
N_etapas_notch = filtro_notch.shape[0]
zi_notch = np.zeros((N_etapas_notch,2))

#Importar una señal
senial_entrada      = np.float32(m2p.memoria2array_float32(senial_path))
senial_micro        = np.float32(m2p.memoria2array_float32(senial_micro_path))
senial_umbral_micro = np.float32(m2p.memoria2array_float32(senial_umbral_path))
#senial_entrada = importar_senial_octave(senial_path)

# senial_entrada = senial_entrada[65:] - np.average(senial_entrada)

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
senial_filtrada_offline = np.float32(senial_filtrada_offline)
# senial_filtrada_offline = senial_filtrada_offline ** 2

# senial_filtrada_offline = senial_entrada
# #Derivamos y sacamos ruido
# senial_filtrada_offline = lfilter(b_notch, a_notch, senial_filtrada_offline)
# #Convertimos a entero, como esta en el micro
# senial_filtrada_offline = np.float32(senial_filtrada_offline)

longitud_total = len(senial_entrada)

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
    # #Convertimos a float32, como esta en el micro
    senial_filtrada = np.float32(senial_filtrada)
    senial_filtrada_final = np.append(senial_filtrada_final, senial_filtrada)
    
    for i in range(TAMANIO_BLOQUE_FILTRADO):
        #Extraemos un dato y escalamos
        u0 = np.float32(escalar_senial(senial_filtrada[i], ganancia, GANANCIA_ADS))
        
        #Derivamos
        x0 = np.float32(u0 - u2)
        u2 = u1
        u1 = u0

        #Transformacion no lineal
        y = np.float32(x0 * x1 * x2)
        x2 = x1
        x1 = x0
        if y < 0:
            y = 0
        senial_procesada_final = np.append(senial_procesada_final, y)
        
        #Integramos
        # agregar_y_desplazar(vector_integral, y, CANT_PROMEDIOS)
        # dato = promedio(vector_integral)
        # senial_integrada_final = np.append(senial_integrada_final, dato)
        
        dato = y
        
        #Siempre que no estemos buscando maximo usamos los datos para el ruido
        if contador_buscando_maximo == 0:
            acumulador_ruido = acumulador_ruido + dato
            contador_ruido = contador_ruido + 1
            
        #Maquina de estados    
        if estado == QRS_BUSCANDO:
            if dato > umbral_inferior:
                contador_umbral_inferior = contador_umbral_inferior + 1
                
                if dato > maximo_local:
                    maximo_local = dato
                    muestras_desde_maximo_local = 0
                    
            elif contador_umbral_inferior != 0:
                contador_umbral_inferior = contador_umbral_inferior -1
            else:
                maximo_local = 0
                
            if dato > umbral_superior:
                contador_umbral_superior = contador_umbral_superior + 1
            elif contador_umbral_superior != 0:
                contador_umbral_superior = contador_umbral_superior - 1
                
            if contador_umbral_inferior >= PERIODO_VALIDACION_UI:
                if contador_umbral_superior >= PERIODO_VALIDACION_US:
                    contador_umbral_inferior = 0
                    contador_umbral_inferior = 0
                    estado = QRS_BLOQUEADO
                    flag_periodo_refractario = True
                    muestras_deteccion_bloqueada = PERIODO_REFRACTARIO
                    contador_buscando_maximo = PERIODO_BUSQUEDA
                    umbral_minimo = CTE_UMBRAL_MINIMO * acumulador_ruido / contador_ruido
                    acumulador_ruido = 0
                    contador_ruido = 0
            
        elif estado == QRS_BLOQUEADO:
            if flag_periodo_refractario:
                if contador_buscando_maximo != 0:
                    contador_buscando_maximo = contador_buscando_maximo - 1
                    
                    if dato > maximo_local:
                        maximo_local = dato
                        muestras_desde_maximo_local = 0
                    
                    if contador_buscando_maximo == 0:
                        maximo = maximo_local
                        muestras_desde_contacto = muestras_desde_maximo_local
                        maximo_local = 0
                        muestras_desde_maximo_local = 0
                        
            if muestras_deteccion_bloqueada != 0:
                muestras_deteccion_bloqueada = muestras_deteccion_bloqueada - 1
                if muestras_deteccion_bloqueada == 0:
                   if flag_periodo_refractario:
                       estado = QRS_BUSCANDO
                       contador_umbral_inferior = 0
                       contador_umbral_superior = 0
                        
        else: #Estado de reset            
            estado = QRS_RESET
            contador_tiempo_reset = contador_tiempo_reset + 1
            maximo = 0
            if contador_ruido != 0:
                umbral_minimo = acumulador_ruido / contador_ruido
            if contador_tiempo_reset > PERIODO_RESET:
                contador_tiempo_reset = 0
                estado = QRS_BUSCANDO
        
        #Esto se ejecuta en cada muestra para todos los estados:
        #Recalculamos el umbral
        if umbral_minimo < UMBRAL_MINIMO:
            umbral_minimo = UMBRAL_MINIMO
            
        umbral_superior = declinacion_hiperbolica(maximo, CTE_HIPERBOLICA, muestras_desde_contacto)
        if umbral_superior < umbral_minimo: umbral_superior = umbral_minimo
        
        umbral_inferior = PROP_UMBRAL_INFERIOR * umbral_superior
        if umbral_inferior < umbral_minimo: umbral_inferior = umbral_minimo
        
        muestras_desde_contacto = muestras_desde_contacto + 1
        muestras_desde_maximo_local = muestras_desde_maximo_local + 1
        
        #Incrementamos el tiempo total
        indice_global = indice_global + 1
        
        #Preparo vectores para graficar
        senial_umbral_superior = np.append(senial_umbral_superior, umbral_superior)
        senial_umbral_inferior = np.append(senial_umbral_inferior, umbral_inferior)
        senial_maximo = np.append(senial_maximo, maximo)
        senial_bloqueo = np.append(senial_bloqueo, 2500 * deteccion_bloqueada)
        senial_umbral_minimo.append(umbral_minimo)
        senial_maximo_local = np.append(senial_maximo_local, maximo_local)
        
        # if contador_muestras_validas != 0:
        #     print(contador_muestras_validas)


senial_filtrada = filtrar(senial_entrada, filtro)
fig0, [ax0, ax1, ax2] = plt.subplots(3,1)
# ax0.plot(senial_entrada, label='entrada')
ax1.plot(senial_entrada, label='entrada')
# ax0.plot(senial_filtrada_final, label='filtrada')
ax0.plot(senial_procesada_final, label='procesada', drawstyle='steps-post')
#ax0.plot(senial_bloqueo, label='bloqueo')
ax0.plot(senial_umbral_superior, label='U+', drawstyle='steps-post')
ax0.plot(senial_umbral_inferior, label='U-', drawstyle='steps-post')
ax0.plot(senial_umbral_minimo, label='umbral minimo', drawstyle='steps-post')
ax0.plot(senial_maximo, label='maximo')
# ax0.plot(senial_maximo_local, label='maximo local')
# ax0.plot(senial_filtrada_offline, label='offline')
#ax0.plot(senial_integrada_final, label='integrada')
# ax0.stem(vector_maximos, label='maximos', markerfmt='-')
# ax0.stem(vector_pulsos, label='pulsos', markerfmt='-')
# ax0.plot(senial_micro, label='micro', drawstyle='steps-post')
# ax0.plot(senial_umbral_micro, label='umbral micro', drawstyle='steps-post')
#ax0.plot(vector_buscando_maximo, label='buscando')
ax1.stem(vector_pulsos, label='pulsos', markerfmt='-')

fft_original = fft(senial_entrada)
fft_original[0] = 0+0j
N = len(senial_entrada)
freq = fftfreq(N, 1/FS)[:N//2]
w, mag, phase = bode((b, a), w=freq)

ax2.plot(freq, 2.0/N * np.abs(fft_original[0:N//2]), label='entrada')
ax2.plot(w, mag, label='filtro')

fig0.suptitle(senial_path.split(sep='/')[-1] + '\n' + filtro_qrs_path.split(sep='/')[-1])
ax0.legend()
ax1.legend()
ax2.legend()

ax0.set_title('Procesamiento')
ax1.set_title('Resultados')
ax2.set_title('Espectro')

ax0.grid(True)
ax1.grid(True)
ax2.grid(True)

mplcursors.cursor()

plt.show()
