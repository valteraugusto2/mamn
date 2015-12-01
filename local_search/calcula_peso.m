%{
Calcula os pesos que serao utilizados para fornecer a probabilidade de cada
operador local ser escolhido.

Recebe: u, w atual e r atual.
Retorna: w novo.
%}

function w_novo = calcula_peso(u, w_atual, r_atual)

    w_novo = (1 - u)*w_atual + r_atual;
