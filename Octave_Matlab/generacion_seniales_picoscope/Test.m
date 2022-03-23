Fs=50000;   % Se usa para la se�al de calibracion unicamente
t = 0:1/Fs:10;
Fa = 500;
%y = square(2*pi*Fa*t);
y = sin(2*pi*t*Fa);
plot(t,y);

sound (y,Fs,16);      % 16 bits

          
 