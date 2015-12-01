%{
Determina qual operador local sera utilizado.
Recebe: vetor com dois pesos (um pra cada operador. primeiro merge depois split)
Retorna: char s, m ou n.

Caso um peso seja nulo, sua probabilidade eh 0,05. Caso ambos sejam nulos, a
probabilidade de cada um eh 0,05, e a probabilidade de nenhum eh 0,9. Esse eh o
unico caso em que nenhum operador local podera ser escolhido.
%}

function escolha = roleta(pesos)

    x = rand;
    if ((pesos(1) == 0) & (pesos(2) == 0))
        m = 0.95;
        s = 0.05;
    elseif pesos(1) == 0 & pesos(2) ~= 0
        m = 0.95;
        s = 0.95;
    elseif pesos(1) ~= 0 & pesos(2) == 0
        m = 0.05;
        s = 0.05;
    else
        % Passando os pesos pro range 0-1
        s = pesos(2)/(pesos(2)+pesos(1));
        m = s;
    end

    if x <= s
        escolha = 's';
    elseif x > m
        escolha = 'm';
    elseif x > s & x < m
        escolha = 'n';
    end
