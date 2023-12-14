load('p2.mat');

figure;
plot(t, y)

text(0.5, 0.2, 'y(t)');

title('y');
legend('y')
xlabel('t')
ylabel('amplitude')
grid on