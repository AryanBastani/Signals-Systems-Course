chars = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i'...
    'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' ...
    'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];

Mapset = cell(2,32);
char_id = 0:1:31;
binaryNums = dec2bin(char_id, 5);
for map_index=1:32
    Mapset{1,map_index} = chars(map_index);
    Mapset{2,map_index} = binaryNums(map_index, :);
end

for i = 0.1 : 0.2 : 2
    res = coding_amp('signal', 1, Mapset);
    res = res + i * randn(1, length(res));
    massage = decoding_amp(res, 1, Mapset);
    fprintf("output for coef = %d is : %s\n", i, massage);
end

for i = 0.1 : 0.2 : 2
    res = coding_amp('signal', 2, Mapset);
    res = res + i * randn(1, length(res));
    massage = decoding_amp(res, 2, Mapset);
    fprintf("output for coef = %d is : %s\n", i, massage);
end

for i = 0.1 : 0.2 : 2
    res = coding_amp('signal', 3, Mapset);
    res = res + i * randn(1, length(res));
    massage = decoding_amp(res, 3, Mapset);
    fprintf("output for coef = %d is : %s\n", i, massage);
end