function [ sorted_population ] = fitness(population, N)
    costs = zeros(N,51);
    for i = 1 : N
        fis = sugfis("NumInputs",2,"NumOutputs",1, "NumInputMFs",1, "NumOutputMFs",1);
        fis.Inputs(1).Name = "erro";
        fis.Inputs(1).Range = [-15 15];
        fis.Inputs(2).Name = "der_erro";
        fis.Inputs(2).Range = [-5 5];
        fis.Outputs(1).Name = "saida";
        fis.Outputs(1).Range = [-0.25 0.25];
        fis = addMF(fis,"erro","trimf",[-45 population(1,i) population(3,i)]);
        fis = addMF(fis,"erro","trimf",[population(2,i) population(4,i) population(6,i)]);
        fis = addMF(fis,"erro","trimf",[population(5,i) population(7,i) population(9,i)]);
        fis = addMF(fis,"erro","trimf",[population(8,i) population(10,i) population(12,i)]);
        fis = addMF(fis,"erro","trimf",[population(11,i) population(13,i) 45]);
        fis = removeMF(fis,"erro","mf1");

        fis = addMF(fis,"der_erro","trimf",[-5 population(14,i) population(16,i)]);
        fis = addMF(fis,"der_erro","trimf",[population(15,i) population(17,i) population(19,i)]);
        fis = addMF(fis,"der_erro","trimf",[population(18,i) population(20,i) 5]);
        fis = removeMF(fis,"der_erro","mf1");
        
        fis = addMF(fis,"saida","linear",[population(21,i) population(22,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(23,i) population(24,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(25,i) population(26,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(27,i) population(28,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(29,i) population(30,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(31,i) population(32,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(33,i) population(34,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(35,i) population(36,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(37,i) population(38,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(39,i) population(40,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(41,i) population(42,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(43,i) population(44,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(45,i) population(46,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(47,i) population(48,i) 0],'VariableType',"output");
        fis = addMF(fis,"saida","linear",[population(49,i) population(50,i) 0],'VariableType',"output");
        fis = removeMF(fis,"saida","mf1",'VariableType',"output");
        
        %figure(1)
        %plotmf(fis,"input",1)
        %figure(2)
        %plotmf(fis,"input",2)
        
        fis.Rules = [];
        
        rule1 = [1 1 1 1 1];
        rule2 = [2 1 2 1 1];
        rule3 = [3 1 3 1 1];
        rule4 = [4 1 4 1 1];
        rule5 = [5 1 5 1 1];
        rule6 = [1 2 6 1 1];
        rule7 = [2 2 7 1 1];
        rule8 = [3 2 8 1 1];
        rule9 = [4 2 9 1 1];
        rule10 = [5 2 10 1 1];
        rule11 = [1 3 11 1 1];
        rule12 = [2 3 12 1 1];
        rule13 = [3 3 13 1 1];
        rule14 = [4 3 14 1 1];
        rule15 = [5 3 15 1 1];
        
        rules = [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8; rule9; rule10; rule11; rule12; rule13; rule14; rule15];
        
        fis = addRule(fis,rules);
        
        writeFIS(fis, 'fis');
        
        simOut = sim('ModeloTanques', 'timeout', 200);
        niveis = simOut.get('Niveis');
        sinais = simOut.get('ControlSignal');
        
        e1 = sum(sinais(:,2))/size(sinais(:,2),1);
        e2 = sum((sinais(:,2)- e1).^2)/size(sinais(:,2),1);
        e3 = sum((niveis(:,2)-niveis(:,4)).^2)/size(niveis,1);
        
        cost = 0.2*e1 + 0.25*e2 + 0.55*e3;
        
        costs(i,:) = [cost population(:,i)'];
        
        sorted_population = sortrows(costs);
        
    end
end
