clc;
clear all;
close all;

% Define time and y ranges
t_range = -2:0.5:5; % Time range
y_range = -10:0.5:10; % y range

% Create a grid for the vector field
[T, Y] = meshgrid(t_range, y_range);

% Compute the vector field components
U = ones(size(T)); % dt/dt = 1 (time moves forward)
V = T.^2 - Y; % dy/dt = t^2 - y

% Normalize vectors for better visualization
L = sqrt(U.^2 + V.^2); % Compute vector lengths
U = U ./ L; % Normalize dt/dt
V = V ./ L; % Normalize dy/dt

figure; hold on; % Create figure and hold multiple plots

% Plot vector field
quiver(T, Y, U, V, 'r'); % Red arrows for direction field

% Solve the ODE numerically using ode45 for different initial conditions
f = @(t, y) t^2 - y; % Define the differential equation

t_span = [-2, 5]; % Time span for the solution
y0_values = [-5, 0, 2, 5, 10]; % Different initial conditions

for i = 1:length(y0_values)
    [t_sol, y_sol] = ode45(f, t_span, y0_values(i)); % Solve ODE
    plot(t_sol, y_sol, 'LineWidth', 1.5, 'DisplayName', ['y(0) = ', num2str(y0_values(i))]);
end

xlabel('t'); % X-axis label
ylabel('y'); % Y-axis label
title('Vector Field and Solution Curves for dy/dt = t^2 - y'); % Title
legend show; % Show legend
grid on; % Enable grid for better visualization
