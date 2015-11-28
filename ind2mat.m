% Transforma um individuo (linha de centroides) numa matrix, onde cada linha
% corresponde a um centroide. Isso torna mais facil a delimitação dos
% centroides.
% Recebe: individuo, dimensao do centroide.
% Retorna: matriz do individuo.

function ind_mat = ind2mat(ind, dim_cent)
    
    no_lines = qtde_cent(ind, dim_cent);
    no_col = dim_cent;
    ind_mat = reshape(ind, no_lines, no_col);
