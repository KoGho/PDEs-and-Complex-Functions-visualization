clear
clc
close all

[x, y] = meshgrid(-2:0.01:2, -2:0.01:2);
mask = ~((x == 0 & y == 0));
x = x(mask);
y= y(mask);
z = x + 1j*y;

f1 = exp(1./z);
fz1 = abs(f1);

f2 = sin(z)./z;
fz2 = abs(f2);

f3 = 1./z;
fz3 = abs(f3);

f4 = 1./z.^4;
fz4 = abs(f4);

f5 = sin(1./z);
fz5 = abs(f5);

figure()
scatter3(x(:), y(:), fz1(:), 1,  fz1(:), 'filled'); 
zlim([0,10])

figure()
scatter3(x(:), y(:), fz2(:), 1,  fz2(:), 'filled'); 
zlim([0,10])

figure()
scatter3(x(:), y(:), fz3(:), 1,  fz3(:), 'filled'); 
zlim([0,10])

figure()
scatter3(x(:), y(:), fz4(:), 1,  fz4(:), 'filled'); 
zlim([0,10])

figure()
scatter3(x(:), y(:), fz5(:), 1,  fz5(:), 'filled'); 
zlim([0,10])