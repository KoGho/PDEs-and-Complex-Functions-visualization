clear
clc
close all

x = [-5*pi:0.001:-0.001, 0.001:0.001:5*pi];

% y = 1./x.^2;
y = exp(-abs(x));

figure()
plot(x, y, 'displayname', 'function')
grid on
legend show

xi = [-5*pi:0.01:-0.01, 0.01:0.01:5*pi];
z = NaN(1,3140);

for k = 1:3140
z(k) = sum(y.*exp(-1j*x.*xi(k)));
end

maxim = max(abs(z));
z = z/maxim;

figure()
plot(xi, abs(z), 'displayname', 'transform')
grid on
legend show

%%

x1 = [-5*pi:0.01:-0.01, 0.01:0.01:5*pi];

y1 = 1./x1.^2;

figure()
plot(x1, y1, 'displayname', 'function 1')
grid on
legend show

z1 = NaN(1,3140);

for k = 1:3140
z1(k) = sum(y1.*exp(-1j*x1.*xi(k)));
end

maxim1 = max(abs(z1));
z1 = z1/maxim1;

error1 = norm(abs(z1)-abs(z));

figure()
plot(xi, abs(z1), 'displayname', 'transform 1')
grid on
legend show


x2 = [-5*pi:0.1:-0.1, 0.1:0.1:5*pi];

y2 = 1./x2.^2;

figure()
plot(x2, y2, 'displayname', 'function 2')
grid on
legend show

z2 = NaN(1,3140);

for k = 1:3140
z2(k) = sum(y2.*exp(-1j*x2.*xi(k)));
end

maxim2 = max(abs(z2));
z2 = z2/maxim2;

error2 = norm(abs(z2)-abs(z));

figure()
plot(xi, abs(z2), 'displayname', 'transform 2')
grid on
legend show