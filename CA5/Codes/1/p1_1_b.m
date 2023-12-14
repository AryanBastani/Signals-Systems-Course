t_start = -1;
t_end = 1;
fs = 50;
ts = 1/fs;
N = fs * 2;

t = t_start : ts : t_end - ts;
x1 = cos(10 * pi * t);

y = fftshift(fft(x1));
f = (-fs/2) : (fs/N) : (fs/2) - (fs/N);

figure;
plot(f, abs(y))