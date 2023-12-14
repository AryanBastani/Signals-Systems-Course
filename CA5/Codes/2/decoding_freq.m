function decodedmessage = decoding_amp(coded_massg, speed, Mapset)    
    signals = gen_signals(coded_massg, speed);
    
    decodedmessage = [];
    for i = 1 : 5 : size(signals, 2)
        for j = 1 : 32
            if(signals(i : i + 4)== Mapset{2, j})
                decodedmessage = [decodedmessage Mapset{1, j}];
            end
        end  
    end
end

function curr_id = gen_curr_sig(index, coded_massg, speed)
    fs = 100;
    curr_id = [];
    curr_signal = coded_massg(index : index + fs - 1);
    [value, index] = max(abs(fftshift(fft(curr_signal))));
    index = fs / 2 - index + 1;
    for j = 1 : (2 ^ speed)
        if(index < floor(j * fs...
            / (2 ^ (speed + 1))) + 1)
            curr_id = [curr_id dec2bin(j - 1, speed)];
            break;
        end
    end
end

function massg_id = gen_signals(coded_massg, speed)
    massg_id = [];
    fs = 100;
    for i = 1 : fs : size(coded_massg, 2)
        massg_id = [massg_id gen_curr_sig(i, coded_massg, speed)];
    end
end