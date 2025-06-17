clear
clc
close all

res = 0.001;
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
plot(ex, phi)
grid on
title('test function');

% example

n = 100;
dim = length(0:res:1/n-res);
one = n*ones(1,dim);
two = zeros(1, length(ex)/2 - dim);
delta = [zeros(1,length(ex)/2), one, two];

test = delta.*phi.*res;

figure()
plot(ex, delta)
grid on
title('delta')

figure()
plot(ex, test)
grid on
title('action of delta on phi')

xi = ex;
res1 = 0.02;
ex1 = -30:res1:30-res1;
transform = NaN(1, length(ex));

for k = 1:length(ex1)
    transform(k) = sum(delta.*res1.*exp(-1j*ex1.*xi(k)));
end

figure()
plot(ex1, abs(transform), 'displayname', 'transform')
grid on
legend show
