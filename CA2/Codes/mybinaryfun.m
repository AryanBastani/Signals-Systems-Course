function binary_image=mybinaryfun(gray_image,threshold)
    binary_image=zeros(size(gray_image,1),size(gray_image,2));
    for i=1:size(gray_image,1)
        for j=1:size(gray_image,2)
            if(gray_image(i,j)<threshold)
                binary_image(i,j)=0;
            else
                binary_image(i,j)=1;
            end
        end
    end
    binary_image=logical(binary_image);
end

