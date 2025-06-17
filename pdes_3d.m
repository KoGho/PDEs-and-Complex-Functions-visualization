clear
clc
close all

[x1, t1] = meshgrid(0:0.01:2*pi, 0:0.01:3*pi);
z1 = sin(x1-t1);
figure()
scatter3(x1(:), t1(:), z1(:), 1,  z1(:), 'filled'); 
zlim([-1,1])


[x2, t2] = meshgrid(0:0.01:2*pi, 0:0.01:3*pi);
z2 = 0.5*sin(x2 - t2) + 0.5*sin(x2 + t2);
figure()
scatter3(x2(:), t2(:), z2(:), 1,  z2(:), 'filled'); 
zlim([-1,1])