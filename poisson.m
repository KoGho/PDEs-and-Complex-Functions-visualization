clear
clc
close all

% Grid dimensions
n = 5;  % 5x5 grid (including boundaries)
h = 1 / (n - 1);  % Grid spacing (h = 1 / (n - 1))
h2 = h^2;  % h squared

% Right-hand side (Poisson equation with f(x,y) = 1)
f = 1;  % Source term f(x,y)
b = h2 * f * ones((n-2), (n-2));  % Internal b vector (3x3 grid)

% Create a matrix A of size (n-2) * (n-2)
A = zeros((n-2)*(n-2), (n-2)*(n-2));

% Fill the matrix A with the coefficients from the finite difference scheme
for i = 1:(n-2)
    for j = 1:(n-2)
        idx = (i-1)*(n-2) + j;  % Index of the current unknown

        % Diagonal term
        A(idx, idx) = -4;

        % Neighboring terms (up, down, left, right)
        if i > 1
            A(idx, idx - (n-2)) = 1;  % Up
        end
        if i < (n-2)
            A(idx, idx + (n-2)) = 1;  % Down
        end
        if j > 1
            A(idx, idx - 1) = 1;  % Left
        end
        if j < (n-2)
            A(idx, idx + 1) = 1;  % Right
        end
    end
end

% Reshape the right-hand side b vector into a column vector
b_vec = b(:);

% Solve the linear system A * u = b_vec
u_vec = A \ b_vec;

% Reshape the solution back into a 3x3 grid
u = reshape(u_vec, n-2, n-2);

% Create the grid for plotting
[X, Y] = meshgrid(1:n-2, 1:n-2);

% Plot the solution
surf(X, Y, u);
title('Solution to the Poisson Equation');
xlabel('x');
ylabel('y');
zlabel('u(x,y)');
