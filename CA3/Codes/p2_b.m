[audio, fs_audio] = audioread('a.wav');
audio = audio';

nums = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9' '*' '#'];
t_len = 800; % fs = 8000, t = 0.1 ===>> fx * t_len = 800

finded = [];
for number_index = 1 : (2 * t_len) : size(audio, 2)
    current_num = audio(number_index : number_index + t_len - 1);
    
    index_max = 1;
    corr_max = 0;  
    for make_index= 1 : size(nums, 2)
        current_cor = corr2(current_num, make_on(nums(make_index), []));
        if(current_cor > corr_max)
            corr_max = current_cor;
            index_max = make_index;
        end
    end
    
    finded = [finded nums(index_max)];
end

fprintf('%s', finded);