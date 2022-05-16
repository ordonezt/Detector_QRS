# -*- coding: utf-8 -*-
"""
Created on Tue Apr  6 09:00:00 2021

Script para transformar un filtro IIR de pyfda en secciones de segundo orden
aptas para la libreria de ARM CMSIS

@author: tomaso
"""

from scipy import signal
from utils import importar_filtro

def filtro2sos(b, a):
    
    secciones = signal.tf2sos(b, a)
    
    for i in range(secciones.shape[0]):
        print('\nSeccion {:1}'.format(i))
        print('-------------')
        for j in range(secciones.shape[1]):
            if j < 3:
                print('b{:1}{:1} = {:1.20f}'.format(i, j, secciones[i,j]))
            elif j == 3:
                print('')
                print('a{:1}{:1} = {:1.20f}'.format(i, j-3, secciones[i,j]))
            else:
                print('a{:1}{:1} = {:1.20f}'.format(i, j-3, secciones[i,j]))

def archivo2sos(path):
    sos, b, a = importar_filtro(path)
    filtro2sos(b, a)
    