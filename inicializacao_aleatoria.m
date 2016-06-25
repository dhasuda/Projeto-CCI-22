function pesos = inicializacao_aleatoria(numero_inputs, numero_outputs)
% Inicializa aleatoriamente os valores dos pesos da rede neural para uma
% camada com numero_inputs valores de entrada e numero_outputs valores de
% saida

% Eles não podem ser inicialmente zero para que a backpropagation funcione

pesos = rand(numero_outputs, 1 + numero_inputs)*0.24 - 0.12;

end