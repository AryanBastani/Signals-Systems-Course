ts = 1e-9;
the_end = 1e-5; 
tau = 1e-6;

t = 0: ts: the_end;

signal = zeros(1,length(t));
signal(t <= tau) = 1;

plot(t,signal,'LineWidth',4)

title('Sent Signal');
xlabel('t')
ylabel('Signal')