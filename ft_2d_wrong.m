clear
clc
close all

[x1, y1] = meshgrid(-pi:0.01:pi, -pi:0.01:pi);
z1 = exp(-abs(x1) -abs(y1));

figure()
scatter3(x1(:), y1(:), z1(:), 1,  z1(:), 'filled'); 
zlim([-0.1,1])

xi1 = x1;
yi1 = y1;
real_transform = 2./(1+xi1.^2 + yi1.^2);
zi1 = NaN(length(xi1(1,:)),length(xi1(:,1)));

for k1 = 1:length(x1(1,:))
    for k2 = 1:length(x1(:,1))
        zi1(k1, k2) = sum(sum(z1 .* 0.01 .* 0.01 .* exp(-1j * (x1 * xi1(k1,1) + y1 * yi1(1,k2)))));
    end
end

figure()
scatter3(xi1(:), yi1(:), abs(zi1(:)), 1,  abs(zi1(:)), 'filled'); 
zlim([-0.1,2])

figure()
scatter3(xi1(:), yi1(:), real_transform(:), 1,  real_transform(:), 'filled'); 
zlim([-0.1,2])