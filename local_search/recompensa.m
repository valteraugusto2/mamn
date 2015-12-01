%{
Calcula a recompensa de um dado operador local.
Recebe: individuo, melhor fitness, um char 's' ou 'm' (split ou merge) e dados
Retorna: recompensa (escalar real)
%}

function rec = recompensa(ind, melhor_aptidao, op_loc, dados)

    if op_loc == 's'
        list = split(ind, dados);
    elseif op_loc == 'm'
        list = merge(ind, dados);
    else
        error ('Operador local: deve ser m ou s');
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

    
