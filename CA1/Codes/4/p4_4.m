function p4_4(x, speed)
    [y, f] = audioread(x);
    
    if speed == 1
        sound(y, f);
    elseif 0.5 <= speed && speed < 1
        to_add = round((1 / speed) - 1);
        y_s = zeros(1, (to_add + 1) * length(y) - 1);
        for i = 1 : length(y) - 1
            index = ((to_add + 1) * i) - to_add;
            y_s(index) = y(i);
            step = (y(i + 1) - y(i)) / (to_add + 1);
            add_matrix = zeros(1, to_add);
            element = y_s(index);
            for j = 1 : to_add
                add_matrix(j) = element + step;
                element = add_matrix(j);
            end
            y_s(index + 1 : index + to_add) = add_matrix;
        end
        sound(y_s, f);
    else
        error('Invalid Speed!');
    end
end