#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr 16 12:32:20 2021

@author: ord
"""
import numpy as np
# =============================================================================
# function array = memoria2array_int16(ruta_archivo)
#     %Abrimos el archivo para lectura
#     id_archivo = fopen(ruta_archivo, 'r');
#     if id_archivo == -1
#         disp('El archivo no existe')
#     else
#         %Leo el archivo
#         bytes = textscan(id_archivo, '%s');
#         
#         %Ya no lo necesito, lo cierro
#         fclose(id_archivo);
#         
#         %Acomodo la variable para que sea un array
#         bytes = bytes{1};
#         
#         %Separo los bytes en numeros de 16 bits
#         %Siguen estando en hexa y texto
#         int16_hex_texto = strcat(bytes(2:2:end,1), bytes(1:2:end,1));
#         
#         %Lo convierto a numeros
#         array = typecast(uint16(hex2dec(int16_hex_texto)),'int16');
#         
# %         %El primer dato no me sirve (Estado y comando del DEA)
# %         array = array(2:end);
#         
#         %Lo grafico
#         plot(array);
#     end
# end
# =============================================================================
def complemento_a_dos(hex_str, bits):
     valor = int(hex_str, 16)
     if valor & (1 << (bits-1)):
         valor -= 1 << bits
     return valor

def memoria2array_int16(ruta_archivo):
    senial = np.array([])
    
    #Abrimos el archivo para lectura
    try:
        with open(ruta_archivo, 'r') as archivo:
            for linea in archivo:
                vector_bytes = linea.split()
                
                bytes_MSB = vector_bytes[1::2]
                bytes_LSB = vector_bytes[0::2]
                
                for MSB, LSB in zip(bytes_MSB, bytes_LSB):
                    #print(MSB + LSB)
                    dato = complemento_a_dos(MSB + LSB, 16)
                    print(dato)
                    senial = np.append(senial, dato)
    except:
        print('Pone bien la ruta del archivo!!')
        
    return senial