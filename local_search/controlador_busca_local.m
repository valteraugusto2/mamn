%{
Realiza todo o workflow da busca local para um unico individuo.

Recebe: individuo, melhor aptidao, arquivo, dados.
Retorna: individuo atualizado.

O arquivo eh o que contem os pesos/recompensas. Esse arquivo tambem sera
atualizado.
%}

function new_ind = controlador_busca_local(ind, melhor_aptidao, arq_nome, dados)

    % Abrindo arquivo arq_nome para leitura/escrita. Caso ele nao exista, sera
    % criado (opcao a+ faz isso.)

    arq = fopen(arq_nome, 'a+');

