clear
clc
close all

res = 0.0001;
x = -2*pi:res:2*pi;
u = exp(-abs(x));
sequenza = NaN(1,125664);
n = 100;
t = -1/n:res:1/n;
for k = 1:12567
    sequenza(k) = (n/2)*sum(exp(-abs(x(k)-t))*res);
end 

figure()
plot(x, sequenza, 'displayname', 'sequence')
grid on
hold on
plot(x, u, 'displayname', 'u')
legend show

t = -1:res:1;
for k = 1:125664
    sequenza(k) = (1/2)*sum(exp(-abs(x(k)-t))*res);
end
% Initialize the figure
figure()
plot(x, u, 'displayname', 'u')
grid on
hold on

% Set up the plot, initializing with the first frame
h = plot(x, sequenza );
xlabel('x');
ylabel('sequence');
title('Animation from n = 1 to n = 10');

% Loop through each time step to update the plot
for n = 1:10
    t = -1/n:res:1/n;
    for k = 1:125664
        sequenza(k) = (n/2)*sum(exp(-abs(x(k)-t))*res);
    end
    % Update the y-data of the plot
    set(h, 'YData', sequenza );
    % Pause to control the animation speed
    pause(0.1); 
end

hold off