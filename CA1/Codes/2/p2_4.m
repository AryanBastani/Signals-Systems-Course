x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = 105.2 * x - 22.3;
y = y + 0.5 * randn(1, 10);
[alpha, beta] = find_parameters(x, y)