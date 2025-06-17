clear
clc
close all

[x, y] = meshgrid(-1:0.01:1, -1:0.01:1);
mask = ~(x == 0 & y == 0);
x = x(mask);
y= y(mask);
z = x + 1j*y;

f = exp(1./z)./(z.^2 + 4);
fz = abs(f);
fk = angle(f);

figure()
scatter3(x(:), y(:), fz(:), 1,  fz(:), 'filled'); 
xlim([-2,2])
ylim([-1,1])
zlim([-1,10])

figure()
scatter3(x(:), y(:), fk(:), 1,  fk(:), 'filled'); 
xlim([-2,2])
ylim([-1,1])
zlim([-pi,pi])