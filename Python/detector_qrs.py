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

senial_path = 'Signals_ADS/NS_250_1mV.txt'
senial_micro_path = 'Signals_ADS/micro_NS_240_05mV'
filtro_qrs_path = 'C:/Users/tomaso/Documents/Repositorios/PE1901_ADS1194/Docs/Filtros/Filtro_diferenciador_QRS3_IIR.csv'
filtro_pasa_altos_path = 'C:/Users/tomaso/Documents/Repositorios/PE1901_ADS1194/Docs/Filtros/Filtro_pasa_altos_2Hz_IIR.csv'
filtro_notch_path = 0
#Definicion de parametros
FS = 500
TAMANIO_BLOQUE_FILTRADO = 5
UMBRAL_MINIMO = 5000#50#1e-6
GANANCIA_ADS = 1
CTE_HIPERBOLICA = 0.012#0.024#0.006
PERIODO_REFRACTARIO = int(200e-3 * FS)
PERIODO_VALIDACION = int(30e-3 * FS)
PERIODO_BUSQUEDA = int(50e-3 * FS)
CANT_PROMEDIOS = 10

#Variables globales
maximo = 0
maximo_local = 0
umbral = UMBRAL_MINIMO
ganancia = 1
muestras_desde_contacto = 0
indice_global = 0           #Tiene el numero de muestra actual sobre el total
indice_maximo_local = 0
deteccion_bloqueada = 0
contador_muestras_validas = 0
intervalo_entre_pulsos = 0
vector_integral = []
muestras_desde_maximo = 0
buscando_maximo_flag = False
contador_muestras_maximo = 0

#Señales auxiliares
senial_filtrada_final = []
senial_cuadrada_final = []
senial_integrada_final = []
senial_umbral = []
senial_maximo = []

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
#senial_entrada = importar_senial_octave(senial_path)

# senial_filtrada = filtrar(senial_entrada, filtro)
#senial_filtrada = senial_filtrada * senial_filtrada
# fig0, [ax0, ax1] = plt.subplots(2,1)
# ax0.plot(senial_entrada, label='entrada')
# ax0.plot(senial_filtrada, label='salida')
# ax0.legend()

longitud_total = len(senial_entrada)

#Creo un vector de eventos de pulsos
vector_pulsos = np.zeros(longitud_total)

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
        if indice_global == 550:
            maximo = 0
            umbral = UMBRAL_MINIMO
            
        #Filtrarla
        #Sacamos la continua
        senial_filtrada, zi_hp = filtrar(tramo_senial, filtro_hp, zi_hp)
        #Convertimos a entero, como esta en el micro
        senial_filtrada = senial_filtrada.astype(int)
        #Amplificamos
        senial_filtrada = 10 * senial_filtrada
        #Derivamos y sacamos ruido
        senial_filtrada, zi = filtrar(senial_filtrada, filtro, zi)
        #Convertimos a entero, como esta en el micro
        senial_filtrada = senial_filtrada.astype(int)
        senial_filtrada_final = np.append(senial_filtrada_final, senial_filtrada)
        
        for i in range(TAMANIO_BLOQUE_FILTRADO):
            #Extraemos un dato
            dato = escalar_senial(senial_filtrada[i], ganancia, GANANCIA_ADS)
            
            #Elevamos al cuadrado
            dato = dato ** 2
            senial_cuadrada_final = np.append(senial_cuadrada_final, dato)
            
            #Integramos
            agregar_y_desplazar(vector_integral, dato, CANT_PROMEDIOS)
            dato = promedio(vector_integral)
            senial_integrada_final = np.append(senial_integrada_final, dato)
            
            if buscando_maximo_flag == True:
                contador_muestras_maximo = contador_muestras_maximo + 1
                vector_buscando_maximo[indice_global] = 250000
                if dato > maximo_local: #and deteccion_bloqueada == 0:
                    maximo_local = dato
                    indice_maximo_local = indice_global      
                    
                if contador_muestras_maximo > PERIODO_BUSQUEDA:
                    buscando_maximo_flag = False
                    contador_muestras_maximo = 0
                    maximo = maximo_local
                    maximo_local = 0
                    muestras_desde_contacto = indice_global - indice_maximo_local
                    vector_pulsos[indice_maximo_local] = senial_entrada[indice_maximo_local]
                    print(maximo)
            else:
                contador_muestras_maximo = 0
                
            #Vemos si supera el umbral de deteccion
            if dato > umbral:
                
                    
                if dato > maximo_local: #and deteccion_bloqueada == 0:
                    maximo_local = dato
                    indice_maximo_local = indice_global      
                
                #Contamos la cantidad de muestras encima del umbral
                contador_muestras_validas = contador_muestras_validas + 1
                
                #Si la señal se mantiene encima del umbral es un pulso valido
                if contador_muestras_validas >= PERIODO_VALIDACION: 
                    
                    #Si la deteccion no estaba bloqueada hay que validar el pulso
                    if deteccion_bloqueada == 0:
                        
                        #Reiniciamos el tiempo de la envolvente
                        # muestras_desde_contacto = indice_global - indice_maximo_local#0
                        # maximo = maximo_local
                        # maximo_local = 0
                        buscando_maximo_flag = True
                        
                        # print(intervalo_entre_pulsos - muestras_desde_contacto)
                        # intervalo_entre_pulsos = 0
                        #Graficamos la deteccion
                        # vector_pulsos[indice_global] = senial_entrada[indice_global]
                        # print(indice_global)
                        
                        #Bloqueamos la deteccion durante el periodo refractario
                        deteccion_bloqueada = PERIODO_REFRACTARIO
                        
                        #Recalculamos el umbral
                        umbral = declinacion_hiperbolica(maximo, CTE_HIPERBOLICA, muestras_desde_contacto)
                        if umbral < UMBRAL_MINIMO: umbral = UMBRAL_MINIMO
                        
                    else:
                        pass
            else:
                #Si no supero el umbral invalidamos el pulso
                if contador_muestras_validas > 0:
                    contador_muestras_validas = contador_muestras_validas - 1
                # else:
                #     maximo_local = 0
                #     vector_buscando_maximo[indice_global] = -10000
                    
                
                #Calculamos el umbral
                umbral = declinacion_hiperbolica(maximo, CTE_HIPERBOLICA, muestras_desde_contacto)
                if umbral < UMBRAL_MINIMO: umbral = UMBRAL_MINIMO
            
            #Incrementamos el tiempo para la envolvente
            muestras_desde_contacto = muestras_desde_contacto + 1
            
            #Incrementamos el tiempo total
            indice_global = indice_global + 1
            
            intervalo_entre_pulsos = intervalo_entre_pulsos + 1
            
            muestras_desde_maximo = muestras_desde_maximo + 1
            
            #Decrementamos el delay de deteccion bloqueada
            if deteccion_bloqueada > 0:
                deteccion_bloqueada = deteccion_bloqueada - 1
            
            #Preparo vectores para graficar
            senial_umbral = np.append(senial_umbral, umbral)
            senial_maximo = np.append(senial_maximo, maximo)
            
            # if contador_muestras_validas != 0:
            #     print(contador_muestras_validas)


senial_filtrada = filtrar(senial_entrada, filtro)
fig0, [ax0, ax1, ax2] = plt.subplots(3,1)
#ax0.plot(senial_entrada, label='entrada')
ax1.plot(senial_entrada, label='entrada')
#ax0.plot(senial_filtrada_final, label='filtrada')
#ax0.plot(senial_cuadrada_final, label='cuadrada')
ax0.plot(senial_umbral, label='umbral')
#ax0.plot(senial_maximo, label='maximo')
ax0.plot(senial_integrada_final, label='integrada')
#ax0.stem(vector_pulsos, label='pulsos', markerfmt='-')
ax0.plot(senial_micro, label='micro')
ax0.plot(vector_buscando_maximo, label='buscando')
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
