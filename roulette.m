function [ ind1, ind2 ] = roulette(sorted_population)
    indexes = sorted_population(:,1)/sum(sorted_population(:,1));
    
    ind1 = rand();
    
    for i = 1 : size(indexes)
        if ind1 < sum(indexes(1:i))
           ind1 = i;
           break;
        end
    end
    
    ind2 = ind1;
    
    while ind1 == ind2
        ind2 = rand();
    
        for i = 1 : size(indexes)
            if ind2 < sum(indexes(1:i))
               ind2 = i;
               break;
            end
        end
    end
end
