clear
clc
close all

res = 0.01;
[x, y] = meshgrid(1.5:res:3, -3:res:3);
z = x + 1j*y;
n = 1000;
Zeta = zeros(length(x(:,1)), length(x(1,:)));

for k = 1:n
    Zeta = Zeta + k.^(-z);
end

figure()
scatter3(x(:), y(:), abs(Zeta(:)), 1,  abs(Zeta(:)), 'filled'); 
xlim([1.5,3])
ylim([-3,3])
zlim([-1,10])