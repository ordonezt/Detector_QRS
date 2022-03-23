function [t, ytotal] = qrst (Fs, duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT)

t=0:1/Fs:duracionTotal;
ytotal = zeros (size(t));  

% ------------------------------------------------------------------------
% --------------------- QRS ----------------------------------------------
if (amplitudQRS ~= 0)
    yqrs1 = (0.875*amplitudQRS/(0.4375*duracionQRS))*t;                     %Recta creciente
    yqrs2 = -(amplitudQRS/(0.5*duracionQRS))*t+(amplitudQRS*0.875);         %Recta decreciente
    yqrs3 = (0.125*amplitudQRS/(0.0625*duracionQRS))*t-(0.125*amplitudQRS); %Recta creciente
       
    index1 = ceil((0.4375*duracionQRS)*Fs);
    index2 = ceil((0.5*duracionQRS)*Fs);
    index3 = ceil((0.0625*duracionQRS)*Fs);
       
    ytotal(1:index1) = yqrs1(1:index1);    
    ytotal(index1:(index1+index2-1)) = yqrs2(1:index2);
    ytotal(index1+index2:index1+index2+index3-1) = yqrs3(1:index3);

    indexQRSfinal = index1+index2+index3;
    indexFinalSignal = indexQRSfinal;
    
else
    duracionQRS = 0;
    duracionQT = 0;
    indexFinalSignal = 1;
    tiempoPaceQ = 0; % No hay onda QRS
end
    
% ------------------------------------------------------------------------
% --------------------- ONDA T --------------------------------------------
if (amplitudT ~= 0)
    if (duracionQT == 0)
        separacionQRSondaT = 0;
    else
        separacionQRSondaT = duracionQT - duracionQRS - duracionT;   % seg
    end    
    indexseparacionQRSondaT = ceil (separacionQRSondaT*Fs);
    indexT = indexFinalSignal + indexseparacionQRSondaT;
    indexT2 = ceil ((duracionT*Fs));

    fseno = 1/(2*duracionT);               % Calculo de la frecuencia del seno
    yt1 = amplitudT* sin (2*pi*fseno*t);   %Senoidal
    ytotal(indexT:indexT+indexT2) = yt1(1:indexT2+1);
   
    % Posicion del ultimo valor de la señal
    indexFinalSignal = indexT+indexT2;  
    
else
    duracionT = 0;  
    duracionQT = 0;
end
% ------------------------------------------------------------------------
% -------------- REPETICION DE LA SEÑAL -----------------------------------

frec = bpm/60;  % Hz Pulso por segundo
indexSigPulso = ceil (Fs/frec);
veces = floor (duracionTotal / (1/frec) );  

for i=0:veces-2
    ytotal((indexSigPulso*(i+1)):(indexSigPulso*(i+1)+indexFinalSignal-1)) = ytotal(1:indexFinalSignal);
end    

end

