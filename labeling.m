
clear all

clc;

path = "C:\Users\joanb\Desktop\data_incendios\png_scale";
save_path = "C:\Users\joanb\Desktop\data_incendios\masks";
images = dir(fullfile(path,'*.png'));
n_images = numel(images);
n_iter_img = [4, 9, 2, 9, 6, 7, 11, 7, 4, 4, 6];

for i = 1:n_images

    clc;

    img = imread(fullfile(path, images(i).name));
    J = img;

    % Mostrar imagen
    imshow(img)

    % nº iter
    iter = n_iter_img(i);

    %creamos el almacen de máscaras
    masks = zeros(size(img,1), size(img,2), iter);

    for j= 1:iter

    h = drawfreehand(gca);
    mask = logical(createMask(h));
    J = imoverlay(J, mask, 'yellow');
    imshow(J)
    masks(:, :, j) = mask;
    end
    
    [first_part,~] = strtok(images(i).name,'_');
    mask_name = strcat(first_part,'_mask');
    save_path_mask = fullfile(save_path, mask_name);
    save(save_path_mask, 'masks');
end

