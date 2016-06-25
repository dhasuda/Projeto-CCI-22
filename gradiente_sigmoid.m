function g = gradient_sigmoid(x)
% Retorna os valores do gradiente da funcao sigmoid para os valores
% contidos no vetor x

g = sigmoid(x);
g = g .* (1-g);

end