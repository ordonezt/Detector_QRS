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
amplitudT           = 0;
duracionT           = 0;
duracionQT          = 0;
bpmPace             = 0;
amplitudPacemaker   = 0; 
duracionPacemaker   = 0;
tao                 = 0;
tiempoPaceQ         = 0;
secondPulseTime     = 0;
Fs                  = 500;

%%Señal 1
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_1.csv',ysalida.');

%%Señal 2
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_2.csv',ysalida.');

%%Señal 3
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_3.csv',ysalida.');

%%Señal 4
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_4.csv',ysalida.');

%%Señal 5
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_5.csv',ysalida.');

%%Señal 6
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_6.csv',ysalida.');

%%Señal 7
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_7.csv',ysalida.');

%%Señal 8
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_8.csv',ysalida.');

%%Señal 9
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_9.csv',ysalida.');

%%Señal 10
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_10.csv',ysalida.');

%%Señal 11
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_11.csv',ysalida.');

%%Señal 12
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_12.csv',ysalida.');

%%Señal 13
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_13.csv',ysalida.');

%%Señal 14
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_14.csv',ysalida.');

%%Señal 15
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_15.csv',ysalida.');

%%Señal 16
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_16.csv',ysalida.');

%%Señal 17
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_17.csv',ysalida.');

%%Señal 18
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_18.csv',ysalida.');

%%Señal 19
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_19.csv',ysalida.');

%%Señal 20
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_20.csv',ysalida.');

%%Señal 21
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_21.csv',ysalida.');

%%Señal 22
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_22.csv',ysalida.');

%%Señal xx
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 10e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_xx.csv',ysalida.');

%%Señal yy
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 10e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_yy.csv',ysalida.');

%%Señal 23
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_23.csv',ysalida.');

%%Señal 24
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_24.csv',ysalida.');

%%Señal 25
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_25.csv',ysalida.');

%%Señal 26
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_26.csv',ysalida.');

%%Señal 27
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_27.csv',ysalida.');

%%Señal 28
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.1);
csvwrite('15_signal_28.csv',ysalida.');

%%Señal 29
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_29.csv',ysalida.');

%%Señal 30
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_30.csv',ysalida.');

%%Señal 31
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_31.csv',ysalida.');

%%Señal 32
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_32.csv',ysalida.');

%%Señal 33
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_33.csv',ysalida.');

%%Señal 34
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_34.csv',ysalida.');

%%Señal 35
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_35.csv',ysalida.');

%%Señal 36
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_36.csv',ysalida.');

%%Señal 37
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_37.csv',ysalida.');

%%Señal 38
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_38.csv',ysalida.');

%%Señal 39
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_39.csv',ysalida.');

%%Señal 40
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_40.csv',ysalida.');

%%Señal 41
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_41.csv',ysalida.');

%%Señal 42
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_42.csv',ysalida.');

%%Señal 43
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_43.csv',ysalida.');

%%Señal 44
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_44.csv',ysalida.');

%%Señal 45
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_45.csv',ysalida.');

%%Señal 46
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_46.csv',ysalida.');

%%Señal 47
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_47.csv',ysalida.');

%%Señal 48
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_48.csv',ysalida.');

%%Señal 49
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_49.csv',ysalida.');

%%Señal 50
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_50.csv',ysalida.');

%%Señal 51
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
[t,ysalida]= NORMALIZE (t,ytotal,0.4);
csvwrite('15_signal_51.csv',ysalida.');

%%Señal 52
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_52.csv',ysalida.');

%%Señal 53
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_53.csv',ysalida.');

%%Señal 54
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_54.csv',ysalida.');

%%Señal 55
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_55.csv',ysalida.');

%%Señal 56
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_56.csv',ysalida.');

%%Señal 57
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_57.csv',ysalida.');

%%Señal 58
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_58.csv',ysalida.');

%%Señal 59
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_59.csv',ysalida.');

%%Señal 60
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_60.csv',ysalida.');

%%Señal 61
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 40e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_61.csv',ysalida.');

%%Señal 62
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_62.csv',ysalida.');

%%Señal 63
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_63.csv',ysalida.');

%%Señal 64
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_64.csv',ysalida.');

%%Señal 65
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_65.csv',ysalida.');

%%Señal 66
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_66.csv',ysalida.');

%%Señal 67
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_67.csv',ysalida.');

%%Señal 68
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 70e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_68.csv',ysalida.');

%%Señal 69
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_69.csv',ysalida.');

%%Señal 70
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_70.csv',ysalida.');

%%Señal 71
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_71.csv',ysalida.');

%%Señal 72
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_72.csv',ysalida.');

%%Señal 73
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_73.csv',ysalida.');

%%Señal 74
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_74.csv',ysalida.');

%%Señal 75
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 100e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_7.csv',ysalida.');

%%Señal 76
duracionTotal       = 10;
bpm                 = 30;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_76.csv',ysalida.');

%%Señal 77
duracionTotal       = 10;
bpm                 = 60;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_77.csv',ysalida.');

%%Señal 78
duracionTotal       = 10;
bpm                 = 120;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_78.csv',ysalida.');

%%Señal 79
duracionTotal       = 10;
bpm                 = 180;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_79.csv',ysalida.');

%%Señal 80
duracionTotal       = 10;
bpm                 = 250;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_80.csv',ysalida.');

%%Señal 81
duracionTotal       = 10;
bpm                 = 300;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_81.csv',ysalida.');

%%Señal 82
duracionTotal       = 10;
bpm                 = 350;
amplitudQRS         = 1;
duracionQRS         = 120e-3;
[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
[t,ysalida]= NORMALIZE (t,ytotal,1);
csvwrite('15_signal_82.csv',ysalida.');