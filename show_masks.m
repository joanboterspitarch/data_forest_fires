
clear all;

clc;

path = "C:\Users\joanb\Desktop\data_incendios\masks";

masks = dir(fullfile(path,'*.mat'));
%n_iter_img = [4, 9, 2, 9, 6, 7, 11, 7, 4, 4, 6];

for i = 1:numel(masks)
    clc;
    mask = load(fullfile(path, masks(i).name));
    for j = 1:n_iter_img(i)
        ex = mask.masks(:, :, j);
        imshow(ex)
        pause(1)
    end
end

