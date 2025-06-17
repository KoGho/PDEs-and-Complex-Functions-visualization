clear
clc
close all

res = 0.0001;
x = res:res:3-res;
f1 = [0, exp(-1./(x.^2))];
f2 = [0, exp(-1./((1-x).^2))];
f3 = f1./(f1+f2);

g1 = [0, exp(-1./((3-x).^2))];
g2 = [0, exp(-1./((x-2).^2))];
g3 = g1./(g1+g2);

phi = f3.*g3;

ex = [0,x];

figure()
plot(ex, f1)
grid on
hold on 
plot(ex, f2)
hold on 
plot(ex, f3)
legend({'f1','f2','f3'})

figure()
plot(ex, g1)
grid on
hold on 
plot(ex, g2)
hold on 
plot(ex, g3)
legend({'g1', 'g2', 'g3'})

figure()
plot(ex, phi)
grid on
title('test function');

% example

n = 10000;
dim = length(0:res:1/n-res);
one = n*ones(1,dim);
two = zeros(1, length(ex) - dim - 15000);
delta = [zeros(1,15000), one, two];

test = delta.*phi.*res;

figure()
plot(ex, test)
grid on

xi = ex;
transform = NaN(1, 30000);

for k = 1:30000
    transform(k) = sum(delta.*res.*exp(-1j*ex.*xi(k)));
end

figure()
plot(xi, abs(transform), 'displayname', 'transform')
grid on
legend show
