%{
Calcula a recompensa de um dado operador local.
Recebe: individuo, melhor fitness, um inteiro 0 ou 1 (merge ou split) e dados
Retorna: recompensa (escalar real)
%}

function rec = recompensa(ind, melhor_aptidao, op_loc, dados)

    if op_loc == 1
        list = split(ind, dados);
    elseif op_loc == 0
        list = merge(ind, dados);
    else
        error ('Operador local: deve ser 0 (merge) ou 1 (split)');
    end

    % Lembrando que list{1} eh o new_ind; list{2} eh o tempo gasto
    new_ind = list{1};
    t = list{2}

    new_aptidao = aptidao_teste(new_ind);
    old_aptidao = aptidao_teste(ind);
    rec = (new_aptidao/melhor_aptidao)*(new_aptidao - old_aptidao)/sqrt(t);

    if rec < 0
        rec = 0;
    end

    
