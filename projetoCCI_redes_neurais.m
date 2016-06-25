%% Projeto de CCI-22: implementação de redes neurais

% O objetivo é criar um projeto que seja capaz de identificar e classificar
% algarismos. E outras palavras será um identificador de algarismos (0,
% ..., 9).

% Instruções
% ----------------------

% Este é um arquivo que ajudará na apresentação do projeto. Neste script
% serão utilizadas as seguintes funções:

%   (funções que serão utilizadas)

% Não será necessário alterar ou implementar nada para que se possa ver a
% funcionalidade do código
%

%% Inicializacao
close all
clear
clc

%% Variáveis

tamanhoInput = 400;
tamanhoCamadaEscondida = 25;
tamanhoOutput = 10; % O 10 representa o número 0

load('imagens.mat');
fprintf('Imagens carregadas!');
%fprintf('Programa pausado. Pressione enter para continuar...');

% Cada imagem eh representada por um vetor 1x400, e todas estao juntas na
% matriz X(250x400). Ja o vetor y representa o valor de cada algarismo
% contido em X, na mesma ordem. Ambas matrizes sao parte de 'imagens.mat'

%% =========== Parte 1:  Inicializar parâmetros=============
% Para implementarmos a rede neural de duas camadas para classificar
% dígitos vamos aleatoriamente inicializar os valores dos pesos da rede
% neural

fprintf('\nInicializando os parâmetros da rede neural\n');

Theta1_inicial = inicializacao_aleatoria(tamanhoInput, tamanhoCamadaEscondida);
Theta2_inicial = inicializacao_aleatoria(tamanhoCamadaEscondida, tamanhoOutput);

parametros_iniciais = [Theta1_inicial(:); Theta2_inicial(:)];

%% =========== Parte 2:  Treinar rede neural =============
lambda = 1;

parametros_treinados = treinar(X, y, parametros_iniciais, tamanhoInput, tamanhoCamadaEscondida, tamanhoOutput, lambda);

theta1 = reshape(parametros_treinados(1:tamanhoCamadaEscondida*(tamanhoInput+1)),...
    tamanhoCamadaEscondida, (tamanhoInput + 1));
theta2 = reshape(parametros_treinados((1 + tamanhoCamadaEscondida*(tamanhoInput+1)):end),...
    tamanhoOutput, (tamanhoCamadaEscondida+ 1));

fprintf('\nParâmetros treinados! Pressione enter para continuar\n');
pause;


%% =========== Parte 3:  Ler novas imagens e adivinhar! =============
imgem = X;
[pred, prob] = adivinhar(theta1, theta2, imagem);
display(pred);