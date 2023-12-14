function p4_3(x, speed)
    [y, f] = audioread(x);
    
    if speed == 0.5
        y_s = zeros(1, 2*length(y) - 1);
        for i = 1:length(y) - 1
            y_s(2*i - 1) = y(i);
            y_s(2*i) = (y(i) + y(i+1))/2;
        end
        y_s(end) = y(end);
        sound(y_s, f);
    elseif speed == 2
        y_f = y(1:2:end);
        sound(y_f, f);
    else
        error('Invalid Speed!');
    end
end