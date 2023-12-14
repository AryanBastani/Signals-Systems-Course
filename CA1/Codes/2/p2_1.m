load('p2.mat');

figure;
plot(t, x)

text(0.5, 0.2, 'x(t)');

title('x');
legend('x')
xlabel('t')
ylabel('amplitude')
grid on