% PART 1_2
function coded_image = coding(message, image, Mapset) 

    char_id_len = size(Mapset{2,1}, 2);  
    if((char_id_len * size(message, 2)) >...    //error handling
            (size(image,1) * size(image, 2)))
        
        coded_image = NaN;
        fprintf('Invalid length of massage!\n')
        return;
    end
    
    coded_massg = code_the_massg(message, Mapset);
    
    coded_image = code_the_image(coded_massg, image);
end

function coded_massg = code_the_massg(message, Mapset)
    coded_massg = [];
    for massg_index = 1 : size(message, 2)
        for Mapset_index = 1 : size(Mapset, 2)
            if(message(1, massg_index) == Mapset{1, Mapset_index})
                coded_massg = [coded_massg Mapset{2, Mapset_index}];
            end
        end
    end
    coded_massg = [coded_massg Mapset{2, size(Mapset, 2)}];
end

function coded_image = code_the_image(coded_massg, image)
    for massg_index = 1 : size(coded_massg, 2)
        [row, col] = ind2sub(size(image), massg_index);
        current_pixel = image(row, col);
        binPix = dec2bin(current_pixel, 8);
        binPix(8) = coded_massg(1, massg_index);
        image(row, col) = bin2dec(binPix);
    end
    coded_image = image;
end