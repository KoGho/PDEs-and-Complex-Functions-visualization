clear
clc
close all

Q = 4;
f = 1; 
Omega_1 = 2*pi*f; 
Fs = 4; 
Ts = 0.25; 
T=1/f; 
M = round(Q*(Fs/f)); 
n = 0:(M-1); 
t=n*Ts; 
M1 = 8;
Ts1 = 0.5;
n1 = 0:(M1-1);

y = cos(Omega_1*t);

figure(1) 
stem(t,y);
grid on
title("Signal");

res = 0.25;
xi = -20:res:20;

sampled = zeros(1,length(y)/2);

for k = 0:length(y)/2-1
    sampled(k+1) = y(2*k+1);
end

x1 = 0:2*res:4-2*res;

figure()
stem(x1, sampled)
grid on
title("sampled signal")

xi1 = -20:2*res:20;


zd = NaN(1,length(xi));

for k = 1:length(xi)
zd(k) = sum(y.*res.*exp(-1j*t.*xi(k)));
end

figure()
plot(xi, abs(zd), 'displayname', 'transform')
grid on
legend show

zd1 = NaN(1,length(xi1));

for k = 1:length(xi1)
zd1(k) = sum(sampled.*2*res.*exp(-1j*x1.*xi1(k)));
end

figure()
plot(xi1, abs(zd1), 'displayname', 'transform')
grid on
legend show


zi = NaN(1,length(t));

for k = 1:length(t)
zi(k) = (1/2*pi).*sum(zd.*res.*exp(1j*xi.*t(k)));
end

figure()
stem(t, real(zi)/10)
grid on
title("inverse transform")

error = norm(abs(zi)/10-abs(y));
percentage_error = 100*error/norm(y);


zi1 = NaN(1,length(x1));

for k = 1:length(x1)
zi1(k) = (1/2*pi).*sum(zd1.*2*res.*exp(1j*xi1.*x1(k)));
end

figure()
stem(x1, real(zi1)/10)
grid on
title("inverse sampled transform")

error1 = norm(abs(zi1)/10-abs(sampled));
percentage_error1 = 100*error1/norm(sampled);


T_rec = 30e-4;
t_rec=-2*T:T_rec:2*T;
M_rec = length(t_rec);

% y
signal_rec = NaN(M_rec,1);
for n_rec = 1:M_rec
    signal_rec(n_rec) = y*(exp(1j*(1+(-1)^M)/2* ...
                        pi/(M*Ts)*(t_rec(n_rec)-n*Ts)).* ...
                        diric(2*pi*(t_rec(n_rec)-n*Ts)/(M*Ts),M)).';
end

figure()
plot(t_rec, real(signal_rec), 'displayname', 'signal reconstructed')
grid on 
legend show

% zi
signal_reci = NaN(M_rec,1);
for n_rec = 1:M_rec
    signal_reci(n_rec) = real(zi)*(exp(1j*(1+(-1)^M)/2* ...
                        pi/(M*Ts)*(t_rec(n_rec)-n*Ts)).* ...
                        diric(2*pi*(t_rec(n_rec)-n*Ts)/(M*Ts),M)).';
end

figure()
plot(t_rec, real(signal_reci)/20, 'displayname', 'signal reconstructed')
grid on 
legend show

% sampled
signal_recs = NaN(M_rec,1);
for n_rec = 1:M_rec
    signal_recs(n_rec) = sampled*(exp(1j*(1+(-1)^M1)/2* ...
                        pi/(M1*Ts1)*(t_rec(n_rec)-n1*Ts1)).* ...
                        diric(2*pi*(t_rec(n_rec)-n1*Ts1)/(M1*Ts1),M1)).';
end

figure()
plot(t_rec, real(signal_recs), 'displayname', 'signal reconstructed')
grid on 
legend show

% zi1
signal_reci1 = NaN(M_rec,1);
for n_rec = 1:M_rec
    signal_reci1(n_rec) = real(zi1)*(exp(1j*(1+(-1)^M1)/2* ...
                        pi/(M1*Ts1)*(t_rec(n_rec)-n1*Ts1)).* ...
                        diric(2*pi*(t_rec(n_rec)-n1*Ts1)/(M1*Ts1),M1)).';
end

figure()
plot(t_rec, real(signal_reci1)/40, 'displayname', 'signal reconstructed')
grid on 
legend show