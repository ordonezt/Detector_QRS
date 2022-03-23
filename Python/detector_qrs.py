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

senial_path = 'C:/Users/tomaso/Documents/Repositorios/Detector_QRS/Octave_Matlab/generacion_seniales_picoscope/15_signal_1.csv'
filtro_qrs_path = 'C:/Users/tomaso/Documents/Repositorios/PE1901_ADS1194/Docs/Filtros/Filtro_diferenciador_QRS_IIR.csv'
filtro_notch_path = 0
#Definicion de parametros
FS = 500
TAMANIO_BLOQUE_FILTRADO = 5
UMBRAL_MINIMO = 1e-6#5
GANANCIA_ADS = 1
CTE_HIPERBOLICA = 0.006#0.024#
PERIODO_REFRACTARIO = 0.12 * FS
PERIODO_VALIDACION = int(30e-3 * FS)
CANT_PROMEDIOS = 10

#Condiciones iniciales y finales del filtro de QRS
zi = np.zeros((2,2))

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
vector_integral = []

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
filtro = importar_filtro(filtro_qrs_path)

#Importar una señal
#senial_entrada = m2p.memoria2array_int16('C:/Users/tomaso/Documents/Repositorios/Detector_QRS/Python/Signals_ADS/NS_250_1mV.txt')
senial_entrada = importar_senial_octave(senial_path)

# senial_filtrada = filtrar(senial_entrada, filtro)
# senial_filtrada = senial_filtrada * senial_filtrada
# fig0, ax0 = plt.subplots()
# ax0.plot(senial_entrada)
# ax0.plot(senial_filtrada)

longitud_total = len(senial_entrada)

#Creo un vector de eventos de pulsos
vector_pulsos = np.zeros(longitud_total)

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
        
        #Filtrarla
        senial_filtrada, zi = filtrar(tramo_senial, filtro, zi)
        senial_filtrada_final = np.append(senial_filtrada_final, senial_filtrada)
        
        for i in range(TAMANIO_BLOQUE_FILTRADO):
            dato = escalar_senial(senial_filtrada[i], ganancia, GANANCIA_ADS)
            #Elevamos al cuadrado
            dato = dato ** 2
            senial_cuadrada_final = np.append(senial_cuadrada_final, dato)
            
            agregar_y_desplazar(vector_integral, dato, CANT_PROMEDIOS)
            dato = promedio(vector_integral)
            senial_integrada_final = np.append(senial_integrada_final, dato)
            
            #Vemos si supera el umbral de deteccion
            if dato > umbral:
                if dato > maximo_local:
                    maximo_local = dato
                    indice_maximo_local = indice_global
                #Contamos la cantidad de muestras encima del umbral
                contador_muestras_validas = contador_muestras_validas + 1
                #Si la señal se mantiene encima del umbral es un pulso valido
                if contador_muestras_validas >= PERIODO_VALIDACION: 
                    # #Guardamos el dato como maximo
                    # maximo = dato
                    #Reiniciamos el tiempo de la envolvente
                    muestras_desde_contacto = indice_global - indice_maximo_local#0
                    
                    #Si la deteccion no estaba bloqueada hay que validar el pulso
                    if deteccion_bloqueada == 0:
                        maximo = maximo_local
                        maximo_local = 0
                        #Graficamos la deteccion
                        vector_pulsos[indice_global] = senial_entrada[indice_global]
                        print(indice_global)
                        #Bloqueamos la deteccion durante el periodo refractario
                        deteccion_bloqueada = PERIODO_REFRACTARIO
                    else:
                        pass
            else:
                #Si no supero el umbral invalidamos el pulso
                contador_muestras_validas = 0
                #Calculamos el umbral
                umbral = declinacion_hiperbolica(maximo, CTE_HIPERBOLICA, muestras_desde_contacto)
                if umbral < UMBRAL_MINIMO: umbral = UMBRAL_MINIMO
            
            #Incrementamos el tiempo para la envolvente
            muestras_desde_contacto = muestras_desde_contacto + 1
            
            #Incrementamos el tiempo total
            indice_global = indice_global + 1
            
            #Decrementamos el delay de deteccion bloqueada
            if deteccion_bloqueada > 0:
                deteccion_bloqueada = deteccion_bloqueada - 1
            
            #Preparo vectores para graficar
            senial_umbral = np.append(senial_umbral, umbral)
            senial_maximo = np.append(senial_maximo, maximo)


senial_filtrada = filtrar(senial_entrada, filtro)
fig0, [ax0, ax1] = plt.subplots(2,1)
#ax0.plot(senial_entrada, label='entrada')
ax1.plot(senial_entrada, label='entrada')
#ax0.plot(senial_filtrada_final, label='filtrada')
#ax0.plot(senial_cuadrada_final, label='cuadrada')
ax0.plot(senial_umbral, label='umbral')
#ax0.plot(senial_maximo, label='maximo')
ax0.plot(senial_integrada_final, label='integrada')
#ax0.stem(vector_pulsos, label='pulsos', markerfmt='-')
ax1.stem(vector_pulsos, label='pulsos', markerfmt='-')

fig0.suptitle(senial_path[-15:])
ax0.legend()
ax1.legend()
