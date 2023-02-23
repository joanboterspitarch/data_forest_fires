clear all
clc;

path = "C:\Users\joanb\Desktop\data_incendios\png_scale";
save_path = "C:\Users\joanb\Desktop\data_incendios\masks";
images = dir(fullfile(path,'*.png'));
n_images = numel(images);

for i = 1:n_images

    clc;

    img = imread(fullfile(path, images(i).name));
    J = img;

    % Mostrar imagen
    imshow(img)

    %creamos el almacen de máscaras
    masks = zeros(size(img,1), size(img,2), 0);

    j = 1;
    while true
        h = drawfreehand(gca);
        mask = logical(createMask(h));
        J = imoverlay(J, mask, 'yellow');
        imshow(J)
        masks(:, :, j) = mask;
        j = j + 1;
        if j > 20 % Aquí se puede especificar el número máximo de iteraciones
            break;
        end
        resp = input('¿Desea continuar? [y/n]: ', 's');
        if resp ~= 'y'
            break;
        end
    end
    
    [first_part,~] = strtok(images(i).name,'_');
    mask_name = strcat(first_part,'_mask');
    save_path_mask = fullfile(save_path, mask_name);
    save(save_path_mask, 'masks');
end
