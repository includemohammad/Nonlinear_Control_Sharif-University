clc;
clear all;
close all;

x1 = linspace(0, 2*pi, 20); % Define x1 values
c = linspace(0.2, 20, 10);  % Define a range of c values

[X, C] = meshgrid(x1, c); % Create a grid of x1 and c values


U = ones(size(X)); % dx1/dt (Assumed to be 1 for proper scaling)
V = -10 * sin(X) ./ C; % dx2/dt

figure; hold on; % Create a figure and allow multiple plots


quiver(X, C, U, V, 'r'); 


for i = 1:length(c)
    x2 = -10 * sin(x1) / c(i); 
    plot(x2, x1, 'DisplayName', ['c = ', num2str(c(i))]); % Plot the solution curve
end

xlabel('x2'); % X-axis label
ylabel('x1'); % Y-axis label
title('Nonlinearity Analysis with Vector Field'); % Title of the plot
legend show; % Show legend
grid on; 
