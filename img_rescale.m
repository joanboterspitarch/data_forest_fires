

clear all

df = readtable('scale_data.csv', 'Delimiter', ',');

path = 'C:\Users\joanb\Desktop\data_incendios\png\';

lista_archivos = dir(strcat(path,'*.png'));
for i = 1:length(lista_archivos)
    nombre = lista_archivos(i).name;
    % leemos la imagen
    imagen = imread(strcat(path, nombre));
    % hacemos el el cambio de escala
    [n_row, n_col, n_cha] = size(imagen);
    imagen_scale = imresize(imagen, ...
        [floor(n_row * df{i, "Scale_Ref_median"}), floor(n_col * df{i, "Scale_Ref_median"})]);
    imwrite(imagen_scale, strcat('C:\Users\joanb\Desktop\data_incendios\png_scale\', nombre), 'png')
end
