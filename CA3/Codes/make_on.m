function y = make_on(num, pre)
    fs = 8000;
    ts = 1/fs;
    t_len = 0.1;
    t = ts : ts : t_len;
    
    col = [1209 1336 1477];
    row = [697 770 852 941];

    if(num == '0')
        y1 = sin(2 * pi * row(4) * t);
        y2 = sin(2 * pi * col(2) * t);
    elseif(num == '1')
        y1 = sin(2 * pi * row(1) * t);
        y2 = sin(2 * pi * col(1) * t);
    elseif(num == '2')
        y1 = sin(2 * pi * row(1) * t);
        y2 = sin(2 * pi * col(2) * t);
    elseif(num == '3')
        y1 = sin(2 * pi * row(1) * t);
        y2 = sin(2 * pi * col(3) * t);
    elseif(num == '4')
        y1 = sin(2 * pi * row(2) * t);
        y2 = sin(2 * pi * col(1) * t);
    elseif(num == '5')
        y1 = sin(2 * pi * row(2) * t);
        y2 = sin(2 * pi * col(2) * t);
    elseif(num == '6')
        y1 = sin(2 * pi * row(2) * t);
        y2 = sin(2 * pi * col(3) * t);
    elseif(num == '7')
        y1 = sin(2 * pi * row(3) * t);
        y2 = sin(2 * pi * col(1) * t);
    elseif(num == '8')
        y1 = sin(2 * pi * row(3) * t);
        y2 = sin(2 * pi * col(2) * t);
    elseif(num == '9')
        y1 = sin(2 * pi * row(3) * t);
        y2 = sin(2 * pi * col(3) * t);
    elseif(num == '*')
        y1 = sin(2 * pi * row(4) * t);
        y2 = sin(2 * pi * col(1) * t);
    elseif(num == '#')
        y1 = sin(2 * pi * row(4) * t);
        y2 = sin(2 * pi * col(3) * t);
    end
    
    y = ( y1 + y2 ) / 2;
    y = [pre y];
end