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

duracionTotal       = 2;
bpm                 = 60;
amplitudQRS         = 0.025;
duracionQRS         = 100e-3;
amplitudT           = 0.005;
duracionT           = 180e-3;
duracionQT          = 350e-3;
bpmPace             = 60;#60
amplitudPacemaker   = 0.5; #0.4
duracionPacemaker   = 0.5e-3;
tao                 = 1e-6;
tiempoPaceQ         = 150e-3;
secondPulseTime     = 250e-3;
Fs                  = 10000;

[t,ytotal] = QRST_PRO (Fs,duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime); 
#[t,ysalida]= NORMALIZE (t,ytotal,0.2);

csvwrite('13_signal.csv',ytotal.');
plot(t,ytotal);

