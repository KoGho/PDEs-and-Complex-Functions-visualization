clear
clc
close all

[x, y] = meshgrid(-1:0.01:1, -1:0.01:1);
z = x+1i*y;

f = 1./sin(1./z);
f1 = z.^3.*cos(3./z);
f2 = sin(1./z.^2);
f3 = f1 +f2;

figure()
scatter3(x(:), y(:), abs(f3(:)), 1,  abs(f3(:)), 'filled'); 
zlim([-10000,10000])
