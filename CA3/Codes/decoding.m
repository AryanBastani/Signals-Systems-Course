function decoding(image, Mapset)
    message_ids = binerize_massg(image, Mapset);
    
    message = [];
    
    for i = 1 : 5 : size(message_ids,2)
        for j=1:size(Mapset,2)
            if(message_ids(i:i+4)==Mapset{2,j})
                message = [message Mapset{1,j}];
            end
        end  
    end
    
    fprintf('%s', message);
end

function bin_massg = binerize_massg(image, Mapset)
    flag = true;
    col = 1;
    message_ids = [];
    
    while(flag && (col <= size(image, 2)))
        for row = 1 : size(image, 1)
            current_pixel = image(row, col);
            pix_id = dec2bin(current_pixel, 8);
            message_ids = [message_ids, pix_id(8)];
            if(mod(size(message_ids,2), 5) == 0)
                sz = size(message_ids,2);
                if(message_ids(1,sz-4:sz) == Mapset{2, size(Mapset, 2)})
                    flag = false;
                    break;
                end
            end
        end
        col = col + 1;
    end
    
    bin_massg = message_ids(1 : size(message_ids, 2) - 5);
end

