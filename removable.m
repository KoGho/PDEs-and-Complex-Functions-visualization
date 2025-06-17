clear
clc
close all

ascissa = -5:0.01:5;
ordinata = 1./(16*ascissa.^2 +8*ascissa + 17);

figure()
plot(ascissa, ordinata)
grid on

[x, y] = meshgrid(-1:0.01:1, -1:0.01:1);
mask = ~((x == -1/4 & y == 1) | (x == -1/4 & y == -1));
x = x(mask);
y= y(mask);
z = x + 1j*y;

f = pi/16*exp(-abs(z)).*(cos(z/4) - 1j*sin(z/4));
fz = abs(f);

figure()
scatter3(x(:), y(:), fz(:), 1,  fz(:), 'filled'); 
zlim([0,pi/8])

re = 0;
im = -10:0.01:10;
co = re + 1j*im;

fu = pi/16*exp(-abs(co)).*(cos(co/4) - 1j*sin(co/4));
fc = abs(fu);

figure()
plot(im, fc)
grid on