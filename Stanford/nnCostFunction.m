function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
X = X';
% You need to return the following variables correctly 
J = 0;

% Minha implementa��o
X1 = [ones(1, m); X];
X2 = sigmoid(Theta1 * X1);
X21 = [ones(1, size(X2, 2)); X2];
X3 = sigmoid(Theta2 * X21); % terminada a parte de definir os valores das fun��es

Y = zeros(size(X3)); % Y tem as mesmas dimens�es de X3
coluna = zeros(size(X3, 1), 1);
for i=1:size(X3,2)
   coluna(y(i)) = 1;
   Y(:, i) = coluna;
   coluna(y(i)) = 0;
end % Terminada a construcao da matriz das respostas esperadas

erro3 = X3 - Y;
erro2 = (Theta2' * erro3) .* X21 .* (1 - X21);
erro2 = erro2(2:end, :); % temos q tirar a linha correspondente ao bias, que � constante e nao carrega erro

%Theta1 = (Theta1(:, 2:end)); % tiramos a coluna referente ao biaso
%Theta2 = (Theta2(:, 2:end));

Theta1_grad = X1 * erro2' + (lambda/m) * Theta1';
Theta2_grad = X21 * erro3' + (lambda/m) * Theta2';
grad = [Theta1_grad(:) ; Theta2_grad(:)];

R = -(Y .* log(X3) + (1 - Y) .* log(1 - X3));
Theta1 = Theta1 .^2; % elevamos ao quadrado para utilizar na funcao de custo
Theta2 = Theta2 .^2;
J = (ones(1, size(R, 1)) * R * ones(size(R, 2), 1) + (lambda/2)*(ones(1, size(Theta1, 1)) * Theta1 * ones(size(Theta1, 2), 1) + ones(1, size(Theta2, 1)) * Theta2 * ones(size(Theta2, 2), 1)))/m;
% Final da minha implementa��o


% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
% -------------------------------------------------------------

% =========================================================================

% Unroll gradients


end
