ts = 1e-9;
the_end = 1e-5; 
tau = 1e-6;

t = 0: ts: the_end;
tlen = length(t);
N = round(tlen / (the_end / tau));

alpha = 0.5;
R = 450;
td = 2*R/physconst('LightSpeed');

rec_signal = zeros(1, tlen);
rec_signal(td <= t & td + tau >= t) = alpha;

noise_alpha = 0 : 0.2 : 5;
errors = zeros(1, 26);
for i = 1 : 26
    noisy_estim = zeros(1, 100);
    noisy_rec = zeros(1, tlen);
    for j= 1:100
      noisy_rec = rec_signal + (noise_alpha(i) * randn(1, tlen));
      noisy_estim(j) = r_estimate(noisy_rec, t, N);  
    end
    errors(i) = abs(R - mean(noisy_estim));
end

figure;
plot(noise_alpha, errors, 'LineWidth', 4)
title('Error for different noises');
xlabel('Noise Alpha')
ylabel('Eroor')



