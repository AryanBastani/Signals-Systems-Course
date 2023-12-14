[x, f] = audioread('sherr.wav');

plot(x);
title("poem");
xlabel('t');

audiowrite('x.wav', x, f);
