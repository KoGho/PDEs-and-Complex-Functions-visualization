clear
clc
close all

[x, y] = meshgrid(-2:0.01:2, -2:0.01:2);
mask = ~((x == 1 & y == 1) | (x == -1 & y == 1) | (x == 1 & y == -1) | (x == -1 & y == -1));
x = x(mask);
y= y(mask);
z = x + 1j*y;

f = (z.^2 + 2)./(z.^4+4);
fz = abs(f);

figure()
scatter3(x(:), y(:), fz(:), 1,  fz(:), 'filled'); 
zlim([0,10])