function codded_massg = coding_amp(massg, speed, Mapset)
    len = strlength(massg);
    step = 1 / (2 ^ speed - 1);
    first_code = [];
    codded_massg = [];
    for i = 1 : len
        for j = 1 : 32
            if Mapset{1, j} == massg(1, i)
                first_code = [first_code Mapset{2, j}];
                break;
            end
        end
    end
    t = 0 : 0.01 : 0.99;
    for i = 1 : speed : len*5
        current_code = [];
        current_code = first_code(i:i+speed-1);
        current = step * bin2dec(current_code) * sin(2 * pi * t);
        codded_massg = [codded_massg current];
    end
end









