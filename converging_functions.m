clear 
clc
close all

x = 0:0.01:10;
y = 1./(1+x.^2);
z = exp(-x.^2);

figure()
plot(x, y)
hold on
plot(x, z)
grid on
