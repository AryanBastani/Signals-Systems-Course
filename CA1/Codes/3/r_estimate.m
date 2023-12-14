function r = r_estimate(rec_signal, t, N)
max = 0;
max_ind = 0;
tlen = length(t);

for i=1:tlen-N
    tempp=zeros(1,tlen);
    tempp(i:i+N-1)=1;
    ro=innerproduct(tempp,rec_signal);
    if ro > max
        max = ro;
        max_ind = i;
    end
end

estim_td = t(max_ind);
r = estim_td * physconst('LightSpeed') / 2;
end