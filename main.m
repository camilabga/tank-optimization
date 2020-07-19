clear
clc
%% Parâmetros iniciais

N = 3; % população inicial
M = 120; % população máxima
max_same = 10; % quantidade de vezes que o mesmo indíviduo foi selecionado como melhor
max_gen = 1000; % quantidade de gerações para parada
Pc = 0.7;
Pm = 0.01;
n_best = 1;
size_I1 = 13;
size_I2 = 7;
size_out = 0;
size_rules = 30;

%% Geração da população inicial
population = initialization(N, size_I1, size_I2, size_rules, size_out);

display("Gerou a população!");

cost = fitness(population, N);

display("Calculou os custos!");

%% Loop por geração

for g = 1 : max_gen
    %% Elitismo
    bests = population(:,cost(1,2));
    for c=2 : n_best                        % seleciona n_best melhores de cada geração para permanecer na próxima
        bests = [bests population(:,cost(c,2))];
    end
    
    %% Crossover
    [filho1, filho2] = crossover(population(:,cost(1,2)), population(:,cost(2,2))); % crossover entre os dois melhores individuos da população
    
    for i = 1 : (Pc*N)
        
    end
    
    %% Mutação
    
    
    
    %% Teste do "Custo" dos Novos Indivíduos
    
    
    
    %% Exclusão de Indivíduos menos "evoluídos"
    
    
end