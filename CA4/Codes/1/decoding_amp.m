function decodedmessage = decoding_amp(coded_massg, speed, Mapset)
    all_corrs = gen_corrs(coded_massg);
    
    coef = 0 : 2^speed-1;
    thresh = coef + 1/2;
    
    massg_id = gen_massg_id(all_corrs, thresh, speed);
    
    decodedmessage = [];
    for i = 1 : 5 : size(massg_id, 2)
        for j = 1 : 32
            if(massg_id(i : i + 4)== Mapset{2, j})
                decodedmessage = [decodedmessage Mapset{1, j}];
            end
        end  
    end
end

function all_corrs = gen_corrs(coded_massg)
    all_corrs = [];
    t = 0 : 1/100 : 0.99;
    f = sin(2 * pi * t);
    
    for i = 1 : 100 : size(coded_massg, 2)
        partSignal = coded_massg(i : i+99);
        corr = dot(f, partSignal);
        all_corrs = [all_corrs 2/100*corr];
    end
end

function massg_id = gen_massg_id(all_corrs, thresh, speed)
    massg_id = [];
    for i = 1 : size(all_corrs, 2)
        corr = all_corrs(i) * (2^speed - 1);
        coef = 2 ^ speed - 1;
        for j = 1 : size(thresh, 2)
            if(corr < thresh(j))
                coef = j - 1;
                break;
            end
        end
        massg_id = [massg_id dec2bin(coef, speed)];
    end
end