x = 1 : 3000;
y = randn(1, 3000);

histfit(y);

y_mean = sum(y) / length(y);

epsil2 = sum(y.*y)/length(y);
y_var = epsil2 - y_mean^2;

fprintf("y mean : %f \n", y_mean);
fprintf("y variance : %f \n", y_var);