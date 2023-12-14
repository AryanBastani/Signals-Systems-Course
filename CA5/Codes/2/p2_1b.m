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

res = coding_freq('signal', 5, Mapset);
t = 0 : 0.01 : (size(res, 2) - 1) / 100;
figure;
plot(t, res)