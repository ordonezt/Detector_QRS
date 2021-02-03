function [frecuencia]=Detector_FC(vectorInput, frecuencia)
%Frecuencia = frecuencia de muestreo de la señal

Fsp=500;    %Frecuencia de resampleo
Fs=frecuencia;
vectorInput = vectorInput(1:length(vectorInput));
%resampleo
if Fs~=Fsp
    [p,q]=rat(Fsp/Fs);
    vector=resample(vectorInput, p, q);
else
    vector=vectorInput;
end
vector_crudo=vector;
%%Adaptacion de señal
%Aca lo que hago es ajustar la señal a lo que leeemos del ADC
constanteAtenuacion = 2.2e-3;
vector = vector *constanteAtenuacion;
amplificacion = 240;
offset = 1.5;
 
vector = vector*amplificacion;
vector = vector + offset;

##%Lo primero que hacemos es eliminar el valor medio
##vector = vector - mean(vector);

%Filtro pasa bajos 18Hz
##cutoff_freq_l=40;
##Nyq_Frec=Fsp/2;
##Cutoff_Norm_l=cutoff_freq_l/Nyq_Frec;
##order=50;
##FIR_Coeff_l=fir1(order,Cutoff_Norm_l,'low');
a_pasa_bajos = 1;
b_pasa_bajos = [544,-106,-484,-919,-1118,-779,274,1968,3967,5751,6803,6803,5751,3967,1968,274,-779,-1118,-919,-484,-106,544] / (2^14);

%Filtro pasa altos 12Hz
##cutoff_freq_h=10;
##Nyq_Frec=Fsp/2;
##Cutoff_Norm_h=cutoff_freq_h/Nyq_Frec;
##order=50;
##FIR_Coeff_h=fir1(order,Cutoff_Norm_h,'high');
a_pasa_altos = 1;
b_pasa_altos = [-12,158,-1312,19608,-19609,1311,-159,11]/ (2^14);

%Filtro Notch
a_notch = 1;
b_notch = [3276,3276,3276,3276,3276,3276,3276,3276,3276,3276]/ (2^14);

%Filtrado
X=filter(b_notch,1,vector);
X_aux = filter(b_pasa_bajos,1,X);
X1 =filter(b_pasa_altos,1,X_aux);
X1(1:35) = 0;
##%Elevo al cuadrado
##X2=X.*X;


##%Calculo la derivada
##largo = length(X1);
##for i=1:largo
##    if(i==largo)
##        X2(i)=0;
##    else
##        X2(i)=X1(i+1)-X1(i);
##    end
##end
##X2 = X1*200;

X2 = X1 / 0.1;

%Elevo al cuadrado
X3 = X2.*X2;

%Recorro la señal buscando el maximo y empiezo a detectar
tamanio_bloque = 10;
maximo_tom = 1;
envolvente = maximo_tom;
tiempo_de_maximo = 0;
D = 0.003;
envolvente_vector = zeros(1,length(X3));
pulsos_vector = zeros(1,length(X3));
bloquear_deteccion = false;
contador_deteccion_bloqueada = 0;
indice_global_anterior = 0;
delta_indice = 0;
contador_muestra_2ms = 0;
contador_timeout_frecuencia = 0;
cantidad_promedios = 0;
cantidad_promedios_maxima = 10;
vector_frecuencias_promedio = zeros(1, cantidad_promedios_maxima);
for i=1:(length(X3)-tamanio_bloque)
  
  %Obtego un bloque de la señal
  inicio = 1 + tamanio_bloque*(i-1);
  fin = 1 + tamanio_bloque*(i-1) + tamanio_bloque;
  if inicio>length(X3) || fin>length(X3)
    break;
  end
  
  senial_bloque = X3(inicio : fin);
  
  %Recorro el bloque
  for indice_individual=1:tamanio_bloque
    
    %Estamos en un maximo?
    if senial_bloque(indice_individual) >= envolvente
      %Guardo el maximo
      maximo_tom = senial_bloque(indice_individual);
      %Arranco la envolvente pegada al maximo y reinicio su tiempo
      envolvente = maximo_tom;
      tiempo_de_maximo = 0;
      
      %Si la deteccion no esta bloqueada valido el pulso
      if bloquear_deteccion == false
        indice_global = (i-1)*tamanio_bloque + indice_individual;
        pulsos_vector(indice_global) = 1;
        %Bloqueo la deteccion
        bloquear_deteccion = true;
        delta_indice = indice_global - indice_global_anterior;
        %Aumento la cantidad de promedios
        if cantidad_promedios != cantidad_promedios_maxima
          cantidad_promedios += 1;
        end
        %Si es la primera deteccion no la cuento para el calculo de frecuencia
        if indice_global_anterior == 0
          delta_indice = 0;
          cantidad_promedios = 0;
        end
        indice_global_anterior = indice_global;
      end
    else
      %Decremento la envolvente
      envolvente = maximo_tom / (1 + D * tiempo_de_maximo);
    end
    
    %Incremento el tiempo para la envolvente
    tiempo_de_maximo = tiempo_de_maximo + 1;
    %Guardo la envolvente en un vector para graficarla
    envolvente_vector((i-1)*tamanio_bloque + indice_individual) = envolvente;
    
    %Si la deteccion esta bloqueada la desbloqueo en 200ms
    if bloquear_deteccion == true
      contador_deteccion_bloqueada += 1;
      if contador_deteccion_bloqueada >= 0.2 * Fsp
        contador_deteccion_bloqueada = 0;
        bloquear_deteccion = false;
      end
    end
    
    %Si pasaron 2 segundos bajo la cantidad de promedios
    if (contador_muestra_2ms - contador_timeout_frecuencia) >= (2*Fsp)
      contador_timeout_frecuencia = contador_muestra_2ms;
      if cantidad_promedios != 0
        cantidad_promedios -= 1;
      end
    end
    
    contador_muestra_2ms += 1;
  end
  
  if delta_indice != 0
    frecuencia_cardiaca_actual = 60 * Fsp / delta_indice;
    vector_frecuencias_promedio = [frecuencia_cardiaca_actual, vector_frecuencias_promedio(1:end-1)];
    frecuencia_promediada = mean(vector_frecuencias_promedio(1:cantidad_promedios))
    delta_indice = 0;
    vector_grafico_frecuencias((i-1)*tamanio_bloque) = frecuencia_promediada;
  end
  
  
  
end #for

figure();
subplot(3,1,1);
plot(X2);
hold on;
plot(vector_crudo);
##plot(X2);
plot(X3);
plot(envolvente_vector);
legend('filtrada', 'original', 'cuadrada', 'envolvente');
hold off;
subplot(3,1,2);
plot(pulsos_vector);
subplot(3,1,3);
plot(vector_grafico_frecuencias);

figure();
plot(vector_crudo);
hold on;
plot(pulsos_vector);
hold off;

##%Integro
##windowSize = 16; 
##b = (1/windowSize)*ones(1,windowSize);
##a = 1;
##X4 = filter(b,a,X3);
##
##%Calculo del threshold
##valorMedio = 0;
##for i=1:length(X4)
##    valorMedio = valorMedio + X4(i);
##end
##
##valorMedio = valorMedio/length(X4); 
##
##%Vector de maximos
##largoX4 = length(X4);
##vectorMaximos = zeros (1,largoX4);
##deltaT = 4; %Este valor es para ver si el maximo esta dentro la ventana
##%Tener en cuenta que debe ser positivo
##
##X5 = X4 - valorMedio;
##
##
##for i=1:largoX4
##   if (X5(i)<0)
##       X5(i)=0;
##   end
##end
##
##for i=1:largoX4
##
##    if (i<=deltaT)
##        valorAnterior = 0;
##        valorActual = X5(i);
##        valorProximo = X5(i+deltaT);
##    elseif (i>=(largoX4-deltaT))
##        valorAnterior = X5(i-deltaT);
##        valorActual = X5(i);
##        valorProximo = 0;  
##    else
##        valorAnterior = X5(i-deltaT);
##        valorActual = X5(i);
##        valorProximo = X5(i+deltaT);
##    end
##    
##    if (valorActual>=valorMedio)
##        if ((valorAnterior<=(valorActual))&&(valorProximo<=(valorActual)))
##            vectorMaximos(i)=1;
##        else
##            vectorMaximos(i)=0;
##        end
##    else
##        vectorMaximos(i) = 0;
##    end
##end
##
##%Analisis de maximos y calculo de FC
##%Lo primero que vamos a hacer es eliminar los pulsos extras a traves de
##%una ventana temporal
##ventana = 30;  %150ms/5ms=30
##
##%En esta etapa
##for i=1:(largoX4-ventana)
##    
##    if (vectorMaximos(i)==1)
##           for j=i:(ventana+i)             
##               vectorMaximos(j+1)=0;
##           end
##    end     
##end
##
##%Elimino los pulsos finales
##for i=(largoX4-ventana):largoX4    
##    vectorMaximos(i)=0;   
##end
##
##%Cuento la cantidad de maximos
## contadorMaximos = 0;
## 
## for i=1:largoX4
##     if (vectorMaximos(i)==1)
##         contadorMaximos= contadorMaximos+1;
##     end
## end
## if (contadorMaximos>=5)
##     %genero un vector de maximos
##     tiempos = zeros(1,contadorMaximos);
##     j=1;
##     for i=1:largoX4
##         if (vectorMaximos(i)==1)
##             tiempos(j)= i;
##             j = j + 1;
##         end
##     end
## 
##     deltaTiempoI = tiempos(2)-tiempos(1);
##     diferenciaMaxima = 5;
##     calculoFc = 0;
##     for i=2:(length(tiempos)-1)
##         deltaTiempo = (tiempos(i+1)-tiempos(i));
##
##         if (abs(deltaTiempoI-deltaTiempo)<=diferenciaMaxima)
##             calculoFc = calculoFc + deltaTiempoI;
##             deltaTiempoI = deltaTiempo;
##         else
##             calculoFc = 0;
##              deltaTiempoI = deltaTiempo;
##         end
##     end
##     
##     if (calculoFc)
##        calculoFc = (calculoFc/length(tiempos))*5e-3;
##        frecuencia = (1/calculoFc)*60;
##     else
##         frecuencia = 0;
##     end
## else
##     frecuencia = 0;
## end
##
##figure ()
##subplot(8,1,1)
##plot(vector);
##title('vector');
##subplot(8,1,2);
##plot(X);
##title('X');
##subplot(8,1,3);
##plot(X1);
##title('X1');
##subplot(8,1,4)
##plot(X2);
##title('X2');
##subplot(8,1,5)
##plot(X3);
##title('X3');
##subplot(8,1,6)
##plot(X4);
##title('X4');
##subplot(8,1,7)
##plot(X5);
##title('X5');
##subplot(8,1,8)
##stem (vectorMaximos);
##title('Maximos');
