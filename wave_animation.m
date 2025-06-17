clear
clc
close all

% Define the range for x2 and t2
x2 = 0:0.01:10;
t2 = 0:0.01:10;

% Initialize the figure
figure()
grid on
hold on

% Set up the plot, initializing with the first frame
h = plot(x2, 0.5*sin(x2 - t2(1)) + 0.5*sin(x2 + t2(1)) );
xlabel('x2');
ylabel('z2');
title('Animation of z2 = sin(x2 - t2)');

% Loop through each time step to update the plot
for k = 1:length(t2)
    % Update the y-data of the plot
    set(h, 'YData', 0.5*sin(x2 - t2(k)) + 0.5*sin(x2 + t2(k)) );
    % Pause to control the animation speed
    pause(0.1); % Adjust the pause duration as needed for smoother animation
end

hold off
