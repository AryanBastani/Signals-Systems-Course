function cleanimage = myremovecom(binaryimage, n)
    adjacency_row = [ 0, 0, -1, -1, -1, 1, 1, 1];
    adjacency_col = [-1, 1, 0, -1, 1, 0, -1, 1];
    
    object_set = {};
    visited = zeros(size(binaryimage));
    
    [rows, cols] = size(binaryimage);
    ones = [];
    for i = 1:cols
        for j = 1:rows
            if binaryimage(j, i) == 1
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
                   binaryimage(newX, newY) == 1
               
                      visited(newX, newY) = 1;
                      object_queue = [object_queue [newX; newY]];
                      object = [object [newX; newY]];
                end
            end     
        end
        
        object_set = [object_set object];
    end
    toErase = false(size(binaryimage));
    for p = 1:size(object_set, 2)
        if size(object_set{p}, 2) < n
            indices = sub2ind(size(binaryimage), object_set{p}(1, :), object_set{p}(2, :));
            toErase(indices) = 1;
        end
    end
    
    cleanimage = binaryimage;
    cleanimage(toErase) = 0;
end

function is_valid = is_valid_coordinate(x, y, imageSize)
    is_valid = (x > 0) && (x <= imageSize(1)) && (y > 0) && (y <= imageSize(2));
end