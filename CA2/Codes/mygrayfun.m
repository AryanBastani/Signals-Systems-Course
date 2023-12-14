function gray_image=mygrayfun(image)
    gray_image=zeros(size(image,1),size(image,2));
    for i=1:size(image,1)
        for j=1:size(image,2)
            gray_image(i,j)=0.299*image(i,j,1)+0.578*image(i,j,2)+0.114*image(i,j,3);
        end
    end
    gray_image=uint8(gray_image);
end