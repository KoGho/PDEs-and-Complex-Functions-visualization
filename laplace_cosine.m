clear
clc
close all

% Bilateral Laplace transform
x = [-5*pi:0.01:-0.01,0.01:0.01:5*pi];

y = cos(x);

figure()
plot(x, y, 'displayname', 'function')
grid on
legend show

xi = [-5*pi:0.01:-0.01, 0.01:0.01:5*pi];
f = NaN(1,3140);

for k = 1:3140
f(k) = sum(y.*0.01.*exp(-1j*x.*xi(k)));
end

figure()
plot(xi, abs(f), 'displayname', 'transform')
grid on
legend show

alpha = [-1.00:0.01:-0.01, 0.01:0.01:1.00];
l = NaN(200,3140);
[xi, alpha] = meshgrid(xi, alpha);

for n = 1:200
    for m = 1:3140
    l(n,m) = sum(y.*0.01.*exp(-x.*(alpha(n,1)+1j*xi(1,m))));
    end
end

figure()
scatter3(alpha(:), xi(:), abs(l(:)), 1, abs(l(:)), 'filled')

%% Laplace transform
x = 0.01:0.01:5*pi;

y = cos(x);

figure()
plot(x, y, 'displayname', 'function')
grid on
legend show

xi = [-5*pi:0.01:-0.01, 0.01:0.01:5*pi];
f = NaN(1,3140);

for k = 1:3140
f(k) = sum(y.*0.01.*exp(-1j*x.*xi(k)));
end

figure()
plot(xi, abs(f), 'displayname', 'transform')
grid on
legend show

alpha = 0.01:0.01:1.00;
l = NaN(100,3140);
[xi, alpha] = meshgrid(xi, alpha);

for n = 1:100
    for m = 1:3140
    l(n,m) = sum(y.*0.01.*exp(-x.*(alpha(n,1)+1j*xi(1,m))));
    end
end

figure()
scatter3(alpha(:), xi(:), abs(l(:)), 1, abs(l(:)), 'filled')

%% known Laplace transform
xi = [-5*pi:0.01:-0.01, 0.01:0.01:5*pi];
alpha = 0.01:0.01:1.00;
[xi, alpha] = meshgrid(xi, alpha);

s = alpha + 1j*xi;
l = s./(1+s.^2);

figure()
scatter3(alpha(:), xi(:), abs(l(:)), 1, angle(l(:)), 'filled')