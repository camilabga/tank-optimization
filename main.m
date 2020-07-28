clear
clc
%% Parâmetros iniciais

N = 20; % população inicial
M = 25; % população máxima
max_same = 10; % quantidade de vezes que o mesmo indíviduo foi selecionado como melhor
max_gen = 100; % quantidade de gerações para parada
Pc = 0.5;
Pm = 0.1;
n_best = 1;
size_I1 = 13;
size_I2 = 7;
size_out = 0;
size_rules = 30;

%% Geração da população inicial
population = initialization(N, size_I1, size_I2, size_rules, size_out);

display("Gerou a população!");

sorted_population = fitness(population, N);

display("Calculou os custos!");

last_best = zeros(1,50);
n_same = 0;

%% Loop por geração

for g = 1 : max_gen
    new_population = [];    
    %% Elitismo
    bests = sorted_population(1,2:51);
    if (last_best == bests)
        n_same = n_same + 1;
    else
        last_best = bests;
        n_same = 0;
    end
    for c=2 : n_best                        % seleciona n_best melhores de cada geração para permanecer na próxima
        bests = [bests sorted_population(c,2:51)];
    end
    new_population = [bests]; 
    
    display("Selecionou os melhores (Elitismo)!");
    
    %% Crossover
        
    for i = 1 : (Pc*N)
        [ind1, ind2] = roulette(sorted_population);
        
        [filho1, filho2] = crossover(sorted_population(ind1,2:51)', sorted_population(ind2,2:51)');
        
        new_population = [new_population; filho1; filho2];
        
    end
    
    display("Fez o Crossover! 18+");
    
    %% Mutação
    new_population = [sorted_population(:, 2:51); new_population];
    display("Podem estar acontecendo mutações!");
    for i = 1 : (size(new_population))
        if (rand() < Pm)
            new_ind = mutation(new_population(i,:));
            new_population = [new_population; new_ind];
        end
    end
    
    %% Teste do "Custo" dos Novos Indivíduos
    
    for i = 1 : size(new_population)
       I1 = sort(new_population(i,1:13));
       I2 = sort(new_population(i,14:20));
       new_population(i,:) = [I1 I2 new_population(i,21:50)];
    end
    
    sorted_population = fitness(new_population', size(new_population,1));
    
    %% Exclusão de Indivíduos menos "evoluídos"
    
    while (size(sorted_population,1) > M)
        sorted_population(end,:) = [];
    end
    
    N = size(sorted_population,1);  
    
    %% Checagem de parada
    
    if (n_same == max_same)
        break;
    end
    
    display("Nova geração vindo aí!");
    
end