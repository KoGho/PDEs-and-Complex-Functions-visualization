clear
clc
close all

g = 9.8;
L = 2;
mu = 0.1;

theta_0 = pi/2;
theta_dot_0 = 0;
t = 0:0.001:10-0.01;
number = length(t);
theta = NaN(number,1);
theta(1) = theta_0;
theta_dot = NaN(number,1);
theta_dot(1) = theta_dot_0;
theta_double_dot = NaN(number,1);

for k = 1:number-1
    theta_double_dot(k) = -mu*theta_dot(k)-(g/L)*sin(theta(k));
    theta(k+1) = theta(k) + theta_dot(k)*0.001;
    theta_dot(k+1) = theta_dot(k) + theta_double_dot(k)*0.001;
end

figure()
plot(t,theta)
grid on