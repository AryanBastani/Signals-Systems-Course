t_start = 0;
t_end = 1;
fs = 100;
ts = 1/fs;
N = fs * 1;

t = t_start : ts : t_end - ts;
x2 = cos((30*pi*t) + pi/4);

y = fftshift(fft(x2));
f = (-fs/2) : (fs/N) : (fs/2) - (fs/N);

figure;
plot(f, abs(y))