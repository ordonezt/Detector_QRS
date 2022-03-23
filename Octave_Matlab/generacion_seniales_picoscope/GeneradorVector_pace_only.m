clc
clear
[t, ypace] = paceMaker (10000, 1, 60, 1000, 0.1e-3, 10e-3);

[t,ysalida]= NORMALIZE (t,ypace,1);
[t,ysalida]= NORMALIZE (t,ypace,0.02);
csvwrite('pace.csv',ysalida.');
plot (t,ysalida);

