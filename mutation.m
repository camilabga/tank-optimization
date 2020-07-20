function [ new_ind ] = mutation(individual)
    a = randi(13);
    b = randi(7)+13;
    c = randi(30)+20;
    
    individual(a) = 30*(rand()- 0.5);
    individual(b) = rand()- 0.5;
    individual(c) = 2 * rand();   
    
    I1 = sort(individual(1:13));
    I2 = sort(individual(14:20));
    
    new_ind = [I1 I2 individual(21:50)];
end