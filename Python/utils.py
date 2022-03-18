# -*- coding: utf-8 -*-
"""
Created on Fri Mar 18 14:37:37 2022

@author: tomaso
"""
from scipy.signal import sosfilt, tf2sos
import pandas as pd

def filtrar(entrada, filtro, zi=None):
    # salida, zf = sosfilt(sos=filtro, x=entrada, zi=zi)
    if zi is not None:
        salida, zf = sosfilt(filtro, entrada, zi=zi)
        return salida, zf
    else:
        salida = sosfilt(filtro, entrada)
        return salida

def importar_filtro(archivo):
    #Abro el archivo
    csv = pd.read_csv(archivo, usecols=[0,1], names=['b', 'a'], header=None)
    
    #Obtengo numerador y denominador
    a = csv['a']
    b = csv['b']
    
    #Obtengo el filtro en formato S.O.S.
    sos = tf2sos(b, a)
    
    return sos
    