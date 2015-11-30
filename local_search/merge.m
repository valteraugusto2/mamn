%{
Funcao para realizar merge de clusters num individuo.
Recebe: individuo (matriz), dados; 
Retorna: individuo.

Para saber quais clusters serao fundidos, precisa calcular aptidao de cada
cluster com seu cluster mais proximo. A melhor fusao sera escolhida.
%}

function out_ind = merge(in_ind, dados)
    
    %genpath(addpath('..'));
    % Verificando se individuo eh unica linha ou matriz.
    if size(in_ind,1) == 1
        in_ind = ind2mat(in_ind, dim_cent);
    end

    qtde_cent = size(in_ind,1);
    qtde_dados = size(dados, 1);
    dim_cent = size(in_ind, 2)
    
    % Encontrando o cluster mais proximo a cada um dos clusters
    indices = proximos(in_ind);

    % Calculando pertinencia de cada dado
    pertinencia_ = pertinencia(in_ind, dados);

    % Como cada centroide modificara a pertinencia dos dados,
    % copio o vetor pertinencia para cada centroide
    pertinencia_ = repmat(pertinencia_, qtde_cent, 1);

    % Matriz que armazenara novos individuos teste. Como dois clusters serao
    % fundidos, a quantidade de linhas do individuo sera qtde_cent - 1,
    % mas utilizarei qtde_cent pra facilitar algumas coisas. Depois tirarei
    % a linha extra.
    % Sera um novo individuo para cada centroide
    new_ind = inf*ones(qtde_cent, dim_cent, qtde_cent);

    % Gerando nova matriz de pertinencia, fundindo clusters mais proximos
    % Iterando nos centroides do individuo
    for i = 1:qtde_cent

         % Iterando nos dados. O dado que tiver pertinencia igual a indices(i)
         % tera sua pertinencia modificada para i
        for j = 1:qtde_dados
            if pertinencia_(i,j) == indices(i)
                pertinencia_(i,j) = i;
            end
        end
    end

    count = 0;
    % Gerando os individuos teste para cada centroide 
    % Sinto muito, mas eh praticamente impossivel explicar esse
    % raciocinio em poucas palavras. O que importa eh q funciona perfeitamente.
    for i = 1:qtde_cent
        for j = 1:dim_cent
            for k = unique(pertinencia_(i,:))
                new_ind(k, j, i) = 0;
                for z = 1:qtde_dados
                    if pertinencia_(i,z) == k
                        new_ind(k,j,i) = new_ind(k,j,i) + dados(z,j);             
                        count = count + 1;
                    end
                end
                new_ind(k,j,i) = new_ind(k,j,i)/count;
                count = 0;
            end
        end
    end

    % Retirando linhas com infinito dos novos individuos
    new_ind = reshape(new_ind, 1, qtde_cent*qtde_cent*dim_cent);
    inf_ind = [];
    for i = 1:size(new_ind,2)
        if new_ind(i) == inf
            inf_ind = [inf_ind i];
        end
    end
    new_ind(inf_ind) = [];
    new_ind = reshape(new_ind, qtde_cent-1, dim_cent, qtde_cent)
