% Calcula a quantidade de centroides num individuo.
% Recebe: individuo, dimensao do centroide.
% Retorna: quantidade de centroides.

function count = qtde_cent(in_ind, dim_cent)

    count = length(in_ind)/dim_cent;
