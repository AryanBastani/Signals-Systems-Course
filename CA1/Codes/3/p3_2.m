ts = 1e-9;
the_end = 1e-5; 
tau = 1e-6;

t = 0: ts: the_end;

td = 2*450/physconst('LightSpeed');
alpha = 0.5;

signal = zeros(1, length(t));
signal(td <= t & td + tau >= t) = alpha;

plot(t,signal,'r', 'LineWidth',4)

title('Received Signal');
xlabel('t')
ylabel('Signal')