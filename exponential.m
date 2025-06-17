clear
clc
close all

n = 2;
x = 0:0.001:1;
y = (1./((1 + x./n).^n));
z = exp(-x);

figure()
plot(x, y, 'displayname', 'y')
grid on
hold on
plot(x, z, 'displayname', 'z')
legend show

partial_sum = sum(y*0.001);
real_sum = sum(z*0.001);
error = abs(partial_sum-real_sum);
