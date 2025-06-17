clear
clc
close all

tic
res = 0.1;
x = -2:res:2;
y = 4-x.^2;
xi = -20:res:20;

figure()
plot(x, y, 'displayname', 'signal')
grid on
legend show

zd = NaN(1,length(xi));

for k = 1:length(xi)
zd(k) = sum(y.*res.*exp(-1j*x.*xi(k)));
end

figure()
plot(xi, abs(zd), 'displayname', 'transform')
grid on
legend show

zi = NaN(1,length(x));

for k = 1:length(x)
zi(k) = (1/2*pi).*sum(zd.*res.*exp(1j*xi.*x(k)));
end

figure()
plot(x, abs(zi)/10, 'displayname', 'inverse transform')
grid on
legend show
toc

error = norm(abs(zi)/10-abs(y));
percentage_error = 100*error/norm(y);