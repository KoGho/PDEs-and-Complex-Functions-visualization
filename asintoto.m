clear 
clc
close all

x = [0:0.01:5-0.01,5+0.01:0.01:10];
omega = 5;
y = omega./(omega^2 - x.^2);

figure()
plot(x,y)
grid on