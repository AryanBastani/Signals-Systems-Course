[pcd_f, pcb_p] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'},...
    'Choose your PCB image');
pcb = imread([pcb_p, pcd_f]);

[ic_f, ic_p] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'},...
    'Choose your IC image');
ic = imread([ic_p, ic_f]);

founded = find(pcb, ic, 0.93);

subplot(2, 2, 1);
imshow(pcb); 

subplot(2, 2, 2);
imshow(ic);

subplot(2, 2, 3 : 4);
imshow(pcb);
for i=1:size(founded, 2)
    rectangle('Position', [founded(2, i) ...
        founded(1, i) size(ic, 2) size(ic, 1)],...
        'EdgeColor','b','LineWidth',2);
end




function founded = find(pcb, ic, threshold)
    rotatedIC = imrotate(ic, 180);
    
    founded = [];
    for row = 1 : size(pcb, 1) - size(ic, 1)
        for col = 1 : size(pcb, 2) - size(ic, 2)
            part_of_pcb = pcb(row : row + size(ic, 1) - 1,...
                col : col + size(ic, 2) - 1, :);
            
            currnet_corr = rgb_norm_corr(ic, part_of_pcb);
            current_rotat_corr = rgb_norm_corr(rotatedIC, part_of_pcb);
            
            if((currnet_corr > threshold) || (current_rotat_corr > threshold))
                founded = [founded [row; col]];
            end
        end
    end
end

function corr = rgb_norm_corr(x, y)

    r_corr = norm_corr(x(:,:,1), y(:,:,1));
    g_corr = norm_corr(x(:,:,2), y(:,:,2));
    b_corr = norm_corr(x(:,:,3), y(:,:,3));
    
    corr = (r_corr + g_corr + b_corr) / 3;
end

function corr = norm_corr(x, y)
    x=double(x);
    y=double(y);
    
    xy_sum = sum(sum(x.*y));
    x2_sum = sum(sum(x.*x));
    y2_sum = sum(sum(y.*y));
    
    corr = xy_sum/sqrt(x2_sum*y2_sum);
end