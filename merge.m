%{
Funcao para realizar merge de clusters num individuo.
Recebe: individuo e dimensao do centroide; 
Retorna: individuo.

Para saber quais clusters serao fundidos, precisa calcular aptidao de cada
cluster com seu cluster mais proximo. A melhor fusao sera escolhida.
%}

function out_ind = merge(in_ind, dim_cent)
    
    % Verificando se individuo eh unica linha ou matriz.
    if size(in_ind)(1) == 1
        in_ind = ind2mat(in_ind, dim_cent);
    endif

    qtde_cent = size(in_ind)(1);
    
    % Encontrando o cluster mais proximo a cada um dos clusters
    indices = proximos(in_ind);
