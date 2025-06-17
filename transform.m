clear
clc
close all

tic
x = -20*pi:0.01:20*pi;
y = exp(-abs(x));

figure()
plot(x, y, 'displayname', 'y')
grid on
legend show

xi = x;
real_transform = 2./(1+xi.^2);
z = NaN(1,length(xi));

for k = 1:length(xi)
    z(k) = sum(y.*exp(-1j*x.*xi(k)));
end

figure()
plot(x, abs(z), 'displayname', 'z')
grid on
legend show

figure()
plot(xi, real(real_transform), 'displayname', 'real_transform')
grid on 
legend show
toc

% delta
delta = NaN(1, 12567);

for k = 1:12567
    delta(k) = sum(exp(-1j.*x.*xi(k)));
end

figure()
plot(xi, abs(delta), 'displayname', 'delta')
grid on
legend show

% cosine
cosine = NaN(1, 12567);

for k = 1:12567
    cosine(k) = sum(cos(2*pi*5*x).*exp(-1j.*x.*xi(k)));
end

figure()
plot(xi, abs(cosine), 'displayname', 'cosine')
grid on
legend show