t=0:0.01:1;
z1=sin(2*pi*t);
z2=cos(2*pi*t);

subplot(1, 2, 1);
plot(t,z1,'--b')

text(0.5, 0.2, 'sin(2 \pi t)');

title('Sin'); %Title
legend('sin') %Add legend
xlabel('time') % the name of Y-axis
ylabel('amplitude') % the name of Y-axis
grid on % Add grid

subplot(1, 2, 2);
plot(t,z2,'r')

text(0.25, -0.8, 'cos(2 \pi t)');

title('Cos'); %Title
legend('cos') %Add legend
xlabel('time') % the name of X-axis
ylabel('amplitude') % the name of Y-axis
grid on % Add grid
