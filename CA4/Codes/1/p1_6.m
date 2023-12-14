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

res = coding_amp('signal', 1, Mapset);
res = res + 0.01 * randn(1, length(res));
massage = decoding_amp(res, 1, Mapset);
fprintf("%s\n", massage);

res = coding_amp('signal', 2, Mapset);
res = res + 0.01 * randn(1, length(res));
massage = decoding_amp(res, 2, Mapset);
fprintf("%s\n", massage);

res = coding_amp('signal', 3, Mapset);
res = res + 0.01 * randn(1, length(res));
massage = decoding_amp(res, 3, Mapset);
fprintf("%s\n", massage);
