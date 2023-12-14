ts = 1e-9;
the_end = 1e-5; 
tau = 1e-6;

t = 0: ts: the_end;
tlen = length(t);
N = round(tlen / (the_end / tau));

alpha = 0.5;
R = 450;
td = 2*R/physconst('LightSpeed');

sprintf('R is: %d', R)

rec_signal = zeros(1, tlen);
rec_signal(td <= t & td + tau >= t) = alpha;

estim_r = r_estimate(rec_signal, t, N);

sprintf('estimated_r is: %d', estim_r)

