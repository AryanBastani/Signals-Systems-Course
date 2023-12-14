chars = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i'...
    'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' ...
    'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];

[file, path] = uigetfile(...
    {'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}...
    , 'Please choose image:');
my_image = imread([path, file]);
my_image = rgb2gray(my_image);

Mapset = cell(2,32);
char_id = 0:1:31;
binaryNums = dec2bin(char_id, 5);
for map_index=1:32
    Mapset{1,map_index} = chars(map_index);
    Mapset{2,map_index} = binaryNums(map_index, :);
end

subplot(1,2,1);
imshow(my_image);
title('Image before coding')

my_coded_image = coding('signal', my_image, Mapset);

subplot(1,2,2);
imshow(my_coded_image);
title('Image after coding')

decoding(my_coded_image, Mapset);