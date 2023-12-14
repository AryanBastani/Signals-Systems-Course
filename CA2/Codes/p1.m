
[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
image = imread([path, file]);

image = imresize(image, [300 500]);

gray_image = mygrayfun(image);

threshold = 247 * graythresh(gray_image);

binary_image = ~mybinaryfun(gray_image, threshold);

noiseless_img = myremovecom(binary_image, 400);
background = myremovecom(binary_image, 2300);
clean_image = logical(noiseless_img - background);

figure;
imshow(clean_image);

[labeled_objects, max_num] = mysegmentation(clean_image);

map_list = dir('p1\MapSet');
mapset = cell(2, size(map_list, 1) - 2);
for i = 3:size(map_list)
    name = fullfile('p1\MapSet', map_list(i).name);
    mapset{1, i - 2} = imread(name);
    mapset{2, i - 2} = map_list(i).name(1);
end

corr_threshold = 750;
recognized_chars = '';

for i = 1:max_num
    [row, col] = size(labeled_objects);
    current_label = [];
    for j = 1:col
        for k = 1:row
            if labeled_objects(k, j) == i
                current_label = [current_label [k; j]];
            end
        end
    end
    current_object = clean_image(min(current_label(1, :)):max(current_label(1, :)),...
        min(current_label(2, :)):max(current_label(2, :)));
    current_object = imresize(current_object, [42 24]);
    corr = zeros(1, size(mapset, 2));
    for j = 1:size(mapset, 2)
        bit_xor = ~bitxor(current_object, mapset{1, j});
        corr(j) = sum(bit_xor, 'all');
    end
    [max_corr, corr_index] = max(corr);
    if max_corr > corr_threshold
        recognized_chars = [recognized_chars mapset{2, corr_index}];
    end
end

file = fopen('output.txt', 'wt');
fprintf(file, '%s\n', recognized_chars);
fclose(file);
fprintf('%s\n', recognized_chars);
