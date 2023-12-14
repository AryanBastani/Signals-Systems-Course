[file, path] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
image = imread([path, file]);
image = imresize(image,[NaN 800]);

plate = find_plate(image);
max_x = find_max_x(image, plate);
image = image(plate(1) : plate(1) + plate(3), plate(2) : max_x, : );

image = imresize(image, [300 500]);

gray_image = mygrayfun(image);

threshold = 249*graythresh(gray_image);

binary_image = ~mybinaryfun(gray_image, threshold);

noiseless_img = myremovecom(binary_image, 450);
background = myremovecom(binary_image, 9000);
clean_image = logical(noiseless_img - background);

figure;
imshow(clean_image)

[labeled_objects, max_num] = mysegmentation(clean_image);

map_list = dir('p2\MapSet');
mapset = cell(2, size(map_list, 1) - 2);
for i=3 : size(map_list)
    filename = fullfile('p2\MapSet', map_list(i).name);
    mapset{1,i-2} = imread(filename);
    name = map_list(i).name;
    for j = 1 : length(name)
        if(name(j) == '.')
            break;
        end
    end
    mapset{2,i-2} = name(1:j-1);
end

corr_threshold = 3100;
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
    current_object = imresize(current_object, [84 48]);
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


function plate = find_plate(image)
    bluestrip = imread('p3\bluestrip_big.png');
    
    changed_bluestrips = cell(1,35);
    for i=1:35
        changed_bluestrips{i}=imresize(bluestrip,[NaN size(bluestrip,2)-i+1]);
    end
    
    pos = best_pos(image, changed_bluestrips);

    plate = [pos(1) - 10 pos(2) - 10 pos(3) + 20 pos(4) * 14];
    figure
    imshow(image);
    rectangle('Position',[plate(2) plate(1)...
        plate(4) plate(3)], 'EdgeColor', 'g', 'LineWidth', 2);
end

function pos = best_pos(image, changed_bluestrips)
    current_corr=0;
    for i=1:35
        [maxcorrval,rect] = my_corr(changed_bluestrips{1,i},image);
        if(maxcorrval>current_corr)
            current_corr=maxcorrval;
            pos=rect;
        end
    end
end

function [corr, coordinate] = my_corr(changed_blu, image)
    r_corr = normxcorr2(changed_blu(...
        : , : , 1), image( : , : , 1));
    g_corr = normxcorr2(changed_blu(...
        : , : , 2), image( : , : , 2));
    b_corr = normxcorr2(changed_blu(...
        : , : , 3), image( : , : , 3));
    
    all_corrs = (r_corr + g_corr + b_corr) / 3;
    
    [corr, coordinate] = best_corr(changed_blu, all_corrs);
end

function [corr, coordinate] = best_corr(changed_blus, all_corrs)
    [corr,indx] = max(abs(all_corrs( : )));
    [col,row] = ind2sub(size(all_corrs), indx);
    left_col = col - size(changed_blus, 1);
    up_row = row - size(changed_blus, 2);
    coordinate = [left_col, up_row, size(...
        changed_blus, 1), size(changed_blus, 2)];
end

function max_x = find_max_x(image, plate)
    max_x = plate(2)+plate(4);
    if(max_x > size(image, 2))
        max_x = size(image, 2);
    end
end