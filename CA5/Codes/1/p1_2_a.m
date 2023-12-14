t_start = 0;
t_end = 1;
fs = 100;
ts = 1/fs;

t = t_start : ts : t_end - ts;
x2 = cos((30*pi*t) + pi/4);

figure;
plot(t, x2)