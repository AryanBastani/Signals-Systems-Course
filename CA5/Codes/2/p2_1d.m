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

res = coding_freq('signal', 1, Mapset);
res = res + 0.01 * randn(1, length(res));
massage = decoding_freq(res, 1, Mapset);
fprintf("for speed=1 the decoded message is : %s\n\n\n", massage);

res = coding_freq('signal', 5, Mapset);
res = res + 0.01 * randn(1, length(res));
massage = decoding_freq(res, 5, Mapset);
fprintf("for speed=5 the decoded message is : %s\n", massage);
