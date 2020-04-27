%{
58090046 Mr. Araya Siriadun


MATLAB Assignment
Project 1: Pi Value Estimation by Monte Carlo Methods

The basic process of proposed method:
    Uniformly random x, y values, and then determine whether they are
within the circle. If yes, count number (use the knowledge of Pythagoras
theorem is x ^ 2 + y ^ 2 = r ^ 2), then find the ratio between the number
of points in a circle and the total number of points, which is Pi/4,
Multiply the result by 4 to estimate Pi value.
%}

function Pi = estimatePi(N)
center = [0, 0]; % Coordinates of center of circle.
origin = [center(1) - 1, center(2) - 1]; % Coordinates of origin.
figure('Name', 'One Unit Circle Area Estimation by Monte Carlo Methods', ... % Create a figure and specify the Name property.
    'NumberTitle', 'off');
rectangle('Position', [origin(1), origin(2), 2, 2], ... % Draw a circle in the figure.
    'Curvature', [1, 1], 'FaceColor', ones(1, 3)*14/15, ...
    'LineStyle', 'none');
hold all
axis square;
M = 0; % Number of objects inside the circle
rX = origin(1) + 2 .* rand(N, 1); % Generate a N-by-1 column vector of uniformly distributed numbers in the interval (originX, originX + diameter).
rY = origin(2) + 2 .* rand(N, 1); % Generate a N-by-1 column vector of uniformly distributed numbers in the interval (originY, originY + diameter).
for i = 1:N
    if ((rX(i) - center(1))^2 + (rY(i) - center(2))^2 <= 1) % If the random point is inside the circle.
        plot(rX(i), rY(i), 'r.') % Plot dot with red color.
        M = M + 1; % Increment number of objects inside the circle.
    else
        plot(rX(i), rY(i), 'b.') % Plot dot with blue color.
    end
end
Pi = 4 * M / N; % estimate Pi value
title(['N = ', num2str(N), ', Area of One Unit Circle \approx ', num2str(Pi)]); % display a title
end
