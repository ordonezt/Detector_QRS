

function [t,ytotal] = QRST_PRO (Fs, duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                               bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime)            
%
% duracionTotal:     (seg) Duracion total de la se�al.
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


    % GENERACION DEL COMPLEJO QRST ---------------------------------------
    [t, ytotal] = qrst (Fs, duracionTotal, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT);

    % GENERACION DE EL/LOS PULSOS DE MARCAPASOS --------------------------
    if (bpmPace==0)
        bpmPace = bpm;
    end
    [t, ypace] = paceMaker (Fs, duracionTotal, bpmPace, amplitudPacemaker, duracionPacemaker, tao);

    % OFFSET DE PACEMAKER CON RESPECTO A LA ONDA Q -----------------------
    shiftValue = tiempoPaceQ * Fs;    % tiempoPaceQ mseg antes de Q
    ypace = circshift(ypace,[0 -shiftValue]);             
    ypace(end-shiftValue:end) = 0;            

    % SEGUNDO PULSO DE MARCAPASOS ----------------------------------------
    ypaceDos = zeros(size(ypace));
    if (secondPulseTime ~= 0)
        shiftValue = floor(secondPulseTime * Fs);   % secondPulseTime seg antes del pace pulse anterior
        ypaceDos = circshift(ypace,[0 -shiftValue]);
        ypaceDos(end-shiftValue:end) = 0;
    end
     
    % UNION DE LAS SE�ALES -----------------------------------------------
    ytotal = ytotal + ypace + ypaceDos;
    clear y pace ypaceDos;
    
    % LIMITO LA SE�AL EN CASO QUE EL MARCAPASOS CAIGA ARRIBA DE LA QRST --
    if (amplitudPacemaker>0)    % No se especifica bien que pasa cuando la amplitud es negativa
        ytotal(find(ytotal > amplitudPacemaker)) = amplitudPacemaker;        
    end
end


