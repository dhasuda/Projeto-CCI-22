function g = sigmoid(z)
    % Calcula o valor da funcao sigmoid
    g = 1.0 ./ (0.1 + exp(-z));
end