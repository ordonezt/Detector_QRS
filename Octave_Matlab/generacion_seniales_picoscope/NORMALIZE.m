function [t2,y2] = NORMALIZE (t,y,A)

% Normaliza una funcion al valor A
%El tema de normalizar es porque para señales estandar, 1V se corresponde a 5mV
%y para señales de MP 1V se corresponde a 700mV

% NORMALIZACION -----------------------------------------------------------
maximum = max(y);
factor = A/maximum;
y2 = factor * y;
t2 = t;
% -------------------------------------------------------------------------

end






