clc
clear
#[t, ypace] = paceMaker (10000, 1, 60, 700, 2e-3, 100e-3);
#[t, ytotal] = qrst (10000, 1, 60, 1, 100e-3, 1, 180e-3, 350e-3);

% duracionTotal:     (seg) Duracion total de la señal.
% bpm:               (ppm) Pulsaciones por minuto del complejo QRST.
% amplitudQRS:       (mV)  Amplitud pico a pico del complejo QRS.
% duracionQRS:       (seg) Duracion de complejo QRS.
% amplitudT:         (mV)  Amplitud de la onda T.
% duracionT:         (seg) Duracion de la onda T.
% duracionQT:        (seg) Duracion del complejo QRST.
% bpmPace:           (ppm) Pulsaciones por minuto del pulso de marcapasos.
% amplitudPacemaker: (mV)  Amplitud de pulso de marcapasos.
% duracionPacemaker: (seg) Duracion del pulso de marcapasos.
% tao:               (seg) Constante de tiempo del Overshoot.
% tiempoPaceQ:       (seg) Tiempo entre principio del pace pulse y Q.
% secondPulseTime    (seg) Tiempo entre el 2do pulso de marcapasos y el primero.
duracionTotal       = 1.34;
bpm                 = 80;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
duracionT           = 180e-3;
duracionQT          = 350e-3;
bpmPace             = 0;
amplitudPacemaker   = 0; 
duracionPacemaker   = 0;
tao                 = 0;
tiempoPaceQ         = 0;
secondPulseTime     = 0;
Fs                  = 10000;

%%Señal 61
amplitudT           = 0.25;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.2);
csvwrite('15_signal_61.csv',ysalida.');
plot (t,ysalida);

%%Señal 62
amplitudT           = 0.5;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.2);
csvwrite('15_signal_62.csv',ysalida.');

%%Señal 63
amplitudT           = 0.75;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.2);
csvwrite('15_signal_63.csv',ysalida.');

%%Señal 64
amplitudT           = 1;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.2);
csvwrite('15_signal_64.csv',ysalida.');

%%Señal 65
amplitudQRS         = 0.5;
amplitudT           = 0.625;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_65.csv',ysalida.');

%%Señal 66
amplitudQRS         = 0.5;
amplitudT           = 0.75;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_66.csv',ysalida.');

%%Señal 67
amplitudQRS         = 0.5;
amplitudT           = 1;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_67.csv',ysalida.');