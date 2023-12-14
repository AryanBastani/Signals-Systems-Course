t_start = -1;
t_end = 1;
fs = 50;
ts = 1/fs;

t = t_start : ts : t_end - ts;
x1 = cos(10 * pi * t);


figure;
plot(t, x1)