function [t, ypace] = paceMaker (Fs, duracionTotal, bpmPace, amplitudPacemaker, duracionPacemaker, tao)

t=0:1/Fs:duracionTotal;
ypace = zeros (size(t));  

if (amplitudPacemaker ~= 0)       
    rise_fall_Time = 0.1 * duracionPacemaker;   % 10% de la amplitud, pero menor a 100e-6
    if (rise_fall_Time > 100e-6)
        rise_fall_Time = 100e-6;
    end   
    ampOvershoot = 0.04*amplitudPacemaker;  % < 0.05 amplitudPacemaker
    overshotSettingTime = 5e-6;             % 5useg
    
    index1 = ceil(rise_fall_Time*Fs);
    index2 = ceil(duracionPacemaker*Fs);
    index3 = index1;
    index4 = ceil(overshotSettingTime*Fs);     % Overshoot. Setting time < 5useg. Pendiente negativa Overshoot
    index5 = 6*tao*Fs;
       
    ypace1 = amplitudPacemaker*t/rise_fall_Time;       % pendiente subida    
    ypace2 = amplitudPacemaker*ones(size(t));          % constante    
    ypace3 = amplitudPacemaker - amplitudPacemaker*t/rise_fall_Time;    % Pendiente bajada
    ypace4 = - ampOvershoot*t/overshotSettingTime;                    % Overshot setting time < 5useg
    ypace5 = - ampOvershoot*exp(-t/tao);               % Exponencial decreciente
    
    ypace(1:index1) = ypace1(1:index1);
    ypace(index1:index1+index2-1) = ypace2(1:index2);
    ypace(index1+index2:index1+index2+index3-1) = ypace3(1:index1);
    ypace(index1+index2+index3-1:index1+index2+index3-1+index4) = ypace4(1:index4);    
    ypace(index1+index2+index3-1+index4:index1+index2+index3-1+index4+index5-1) = ypace5(1:index5);        
    
    indexFinalSignal = index1+index2+index3-1+index4+index5-1;
else
    duracionPacemaker = 0;
    tiempoPaceQ = 0;
    tao = 0;       
    return;
end

% ------------------------------------------------------------------------
% -------------- REPETICION DE LA SEÑAL -----------------------------------

frec = bpmPace/60;  % Hz Pulso por segundo
indexSigPulso = ceil (Fs/frec);

veces = floor ( duracionTotal / ( 1/frec ) );  
for i=0:veces-2
    ypace((indexSigPulso*(i+1)):(indexSigPulso*(i+1)+indexFinalSignal-1)) = ypace(1:indexFinalSignal);
end    


end