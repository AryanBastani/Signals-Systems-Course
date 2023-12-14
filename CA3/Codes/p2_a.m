audio = [];
numbers = '43218765';

for number_id = 1 : size(numbers, 2)
    audio = make_audio(numbers(number_id), audio);
end

audiowrite('y.wav', audio, 8000);


function y = make_audio(num, previous_y)
    y = make_on(num, previous_y);
    
    fs = 8000;
    ts = 1/fs;
    t_len = 0.1;
    t = ts : ts : t_len;
   
    off_y = zeros(size(t));
    y = [y off_y];
end