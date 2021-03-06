function parametros = treinar(X, y, parametros_iniciais, tamanhoInput, tamanhoEscondida, tamanhoOutput, lambda)
maxIteracoes = 1000;
passo = 0.01;
parametros = parametros_iniciais;
J = 0;

for i=1:maxIteracoes
   [J grad] = funcao_custo(X, y, parametros, tamanhoInput, tamanhoEscondida, tamanhoOutput, lambda);
   parametros = parametros - passo * grad;
end

end