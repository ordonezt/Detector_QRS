# -*- coding: utf-8 -*-
"""
Created on Fri Mar 18 14:37:37 2022

@author: tomaso
"""
from scipy.signal import sosfilt, tf2sos, lfilter_zi
from scipy.signal.windows import triang
import pandas as pd
import numpy as np

def filtrar(entrada, filtro, zi=None):
    # salida, zf = sosfilt(sos=filtro, x=entrada, zi=zi)
    if zi is not None:
        salida, zf = sosfilt(filtro, entrada, zi=zi)
        return salida, zf
    else:
        salida = sosfilt(filtro, entrada)
        return salida

def importar_filtro(archivo):
    try:
        #Abro el archivo
        csv = pd.read_csv(archivo, usecols=[0,1], names=['b', 'a'], header=None)
        
        #Obtengo numerador y denominador
        a = csv['a']
        b = csv['b']
        b = b.to_numpy()
        a = a.to_numpy()
    except:
        #Abro el archivo
        csv = pd.read_csv(archivo, usecols=[0], names=['b'], header=None)
        
        #Obtengo numerador y denominador
        a = np.array((1.0))
        b = csv['b']
        b = b.to_numpy()
        
    #Obtengo el filtro en formato S.O.S.
    sos = tf2sos(b, a)
    
    return sos, b, a

def escalar_senial(dato, ganancia_ecg, ganancia_ads):
    return dato * ganancia_ecg / ganancia_ads

def declinacion_hiperbolica(q0, D, n):
    return q0 / (1 + D*n)

def agregar_pulso(senial, duracion, amplitud, posicion, FS):
    M = int(duracion * FS)
    pulso = amplitud * triang(M)
    aux = np.delete(senial, np.s_[posicion : posicion + M])
    
    return np.insert(aux, posicion, pulso)

def importar_senial_octave(archivo):
    #Abro el archivo
    csv = pd.read_csv(archivo, usecols=[0], names=['senial'], header=None)
    
    #Obtengo la senial
    senial = csv['senial']
    
    return np.array(senial)

def agregar_y_desplazar(vector, dato, cantidad):
    if len(vector) >= cantidad:
        vector.pop(0)
    vector.append(dato)
    return vector

def promedio(vector):
    return np.average(vector)
