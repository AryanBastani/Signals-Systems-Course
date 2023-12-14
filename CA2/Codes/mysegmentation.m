function [labeled_objcs, max_num]=mysegmentation(image)
    adjacency_row = [ 1, 1, 1, 0, 0, -1, -1, -1];
    adjacency_col = [-1, 0, 1, -1, 1, -1, 0, 1];
    
    object_set = {};
    visited = zeros(size(image));
    
    [rows, cols] = size(image);
    ones = [];
    for i = 1:cols
        for j = 1:rows
            if image(j, i) == 1
                ones = [ones [j; i]];
            end
        end
    end
    
    for k = 1:size(ones, 2)
        current_object = [];
        object_queue = [];
        
        if visited(ones(1, k), ones(2, k))
            continue;
        else 
            visited(ones(1, k), ones(2, k)) = 1;
            object = ones(:, k);
            object_queue = ones(:, k);
        end
        
        while ~isempty(object_queue)
            currentX = object_queue(1, 1);
            currentY = object_queue(2, 1);
            object_queue(:, 1) = [];    
            
            for m = 1:size(adjacency_row, 2)
                newX = currentX + adjacency_row(m);
                newY = currentY + adjacency_col(m);
                
                if is_valid_coordinate(newX, newY, [rows, cols]) && ...
                   ~visited(newX, newY) && ...
                   image(newX, newY) == 1
               
                      visited(newX, newY) = 1;
                      object_queue = [object_queue [newX; newY]];
                      object = [object [newX; newY]];
                end
            end     
        end
        
        object_set = [object_set object];
    end

    max_num=0;
    labeled_objcs=zeros(size(image));
    for i=1:size(object_set, 2)
        current_object=cell2mat(object_set(i));
        index=sub2ind(size(image),current_object(1,:),current_object(2,:));
        labeled_objcs(index)=i;
        max_num=max_num+1;
    end
end

function is_valid = is_valid_coordinate(x, y, imageSize)
    is_valid = (x > 0) && (x <= imageSize(1)) && (y > 0) && (y <= imageSize(2));
end