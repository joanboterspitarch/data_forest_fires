
clear all;

clc;

i = 1;

path = "C:\Users\joanb\Desktop\data_incendios\masks";
path2 = "C:\Users\joanb\Desktop\data_incendios\png_scale\";
masks = dir(fullfile(path,'*.mat'));
lista_archivos = dir(fullfile(path2,'*.png'));
nombre = lista_archivos(i).name;
% leemos la imagen
imagen = imread(strcat(path2, nombre));

mask = load(fullfile(path, masks(i).name));

% Crea una figura con 4 subplots
figure;
subplot(2,2,1);
imshow(imagen);
title('Imágen original');
subplot(2,2,2);
imshow(mask.masks(:,:,2));
title('Máscara 2');
subplot(2,2,3);
imshow(mask.masks(:,:,3));
title('Máscara 3');
subplot(2,2,4);
imshow(mask.masks(:,:,4));
title('Máscara 4');

saveas(gcf, 'fig_ejemplo_masc.png')
