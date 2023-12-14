function customer_calling(number, baje)
    if((number > 99 || number < 1) ||...
            (baje > 9 || baje < 1))
        fprintf('invalid number');
        return;
    end
    َ
    sound = [];

    Mapset = set_mapset();
   
    call_shom(Mapset);
    
    first = mod(number, 10);
    secnond = floor(number / 10) * 10;
    
    if(secnond ~= 0)
        handle_second(Mapset)
    end
    
    for i = 1 : size(Mapset, 2)
        if(strcmp(Mapset{2 , i}, string(first)))
            sound = [sound Mapset{1 , i}'];
        end
    end
    for i = 1 : size(Mapset , 2)
        if(strcmp(Mapset{2 , i} , 'Baje'))
            sound = [sound Mapset{1 , i}'];
        end
    end
    
    for i=1:size(Mapset, 2)
        if(strcmp(Mapset{2,i}, string(baje)))
            sound = [sound Mapset{1,i}'];
        end
    end
    
    sound(sound , fs);
end

function Mapset = set_mapset()
    file = dir('Mapset');
    Mapset=cell(2, size(file, 1) - 2);
    fs = 0;
    for i= 3 : size(file)
        filename = fullfile('Mapset', file(i).name);
        [Mapset{1, i - 2}, fs] = audioread(filename);
        name=file(i).name;
        for j = 1 : length(name)
            if(name(j)=='.')
                break;
            end
        end
        Mapset{2, i - 2}=name(1 : j - 1);
    end
end

function handle_second(Mapset)
    sound = [];
        for i=1:size(Mapset, 2)
            if(strcmp(Mapset{2,i}, string(secnond)))
                sound = [sound Mapset{1,i}'];
            end
        end
        for i=1:size(Mapset, 2)
            if(strcmp(Mapset{2,i}, 'O'))
                sound = [sound Mapset{1,i}'];
            end
        end
end

function call_shom(Mapset)
    sound = [];
    for i = 1 : size(Mapset, 2)
        if(strcmp(Mapset{2,i}, 'Shom'))
            sound = [sound Mapset{1,i}'];
        end
    end
end