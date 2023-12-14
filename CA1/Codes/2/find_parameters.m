function [alpha, beta] = find_parameters(x, y)
    x_mean = mean(x);
    y_mean = mean(y);
    xy_var = sum((x - x_mean).*(y - y_mean));

    beta = (xy_var) / sum((x - x_mean).*(x - x_mean));
    alpha = y_mean - (beta * x_mean);
end