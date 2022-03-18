# -*- coding: utf-8 -*-
"""
Created on Fri Mar 18 09:57:20 2022

Comentario importante: tratar de hacer el codigo del algoritmo lo mas parecido a C
asi el pasaje al micro es facil
@author: tomaso
"""
import matplotlib.pyplot as plt
import interfaz_memoria_python as m2p
from utils import filtrar, importar_filtro
import numpy as np

#Definicion de parametros
TAMANIO_BLOQUE_FILTRADO = 5
zi = np.zeros((2,2))
senial_final = []

#Flags
marcapasos_flag = False
latiguillos_flag = False
insto_flag = False

#Importamos los filtros usados
filtro = importar_filtro('C:/Users/tomaso/Documents/Repositorios/PE1901_ADS1194/Docs/Filtros/Filtro_diferenciador_QRS_IIR.csv')

#Importar una señal
senial_entrada = m2p.memoria2array_int16('C:/Users/tomaso/Documents/Repositorios/Detector_QRS/Python/Signals_ADS/NS_250_1mV.txt')

# senial_filtrada = filtrar(senial_entrada, filtro)
# senial_filtrada = senial_filtrada * senial_filtrada
# fig0, ax0 = plt.subplots()
# ax0.plot(senial_entrada)
# ax0.plot(senial_filtrada)

longitud_total = len(senial_entrada)

indice_extraccion = 0
while indice_extraccion < (longitud_total - TAMANIO_BLOQUE_FILTRADO):
    
    #Extraigo un bloque de señal
    tramo_senial = senial_entrada[indice_extraccion : indice_extraccion + TAMANIO_BLOQUE_FILTRADO]
    indice_extraccion = indice_extraccion + TAMANIO_BLOQUE_FILTRADO
    
    #Si estoy en condiciones de analizar sigo, si no descarto
    #Marcapasos, latiguillos sueltos, insto
    if marcapasos_flag or latiguillos_flag or insto_flag:
        #Descartar tramo
        pass
    else:
        senial_filtrada, zi = filtrar(tramo_senial, filtro, zi)
        senial_final = np.append(senial_final, senial_filtrada)
        #Filtrarla
    
        #Derivar
        
        #Elevar al cuadrado
        
        #Integrar
        
        #Cumplo condiciones para buscar maximo?
            #Si:
                #Buscar maximo durante 100ms
                #Encontre maximo?
                    #Si:
                        #Bloquear busqueda de maximo durante 180ms
                        
        #Calcular umbral
        
        #Pasamos el umbral con histeresis?
            #Si:
                #Duro mas de 50ms?
                    #Si:
                        #QRS detectado

senial_filtrada = filtrar(senial_entrada, filtro)
fig0, ax0 = plt.subplots()
ax0.plot(senial_entrada, label='entrada')
ax0.plot(senial_filtrada, label='salida')
ax0.plot(senial_final, label='tramos')