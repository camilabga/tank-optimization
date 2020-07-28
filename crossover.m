function [ filho1, filho2 ] = crossover(mae, pai)
    
    limits = sortrows(unique(fix(9*rand(4,1)+2)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : (13))]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : (13))]);

    elseif size_cut(1) == 2
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:13)]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:13)]);

    elseif size_cut(1) == 3
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:13)]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:13)]);

    else
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:13)]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:13)]);

    end

    limits = sortrows(unique(fix(3*rand(4,1)+2+13)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : (20))]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : (20))]);

    elseif size_cut(1) == 2
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:20)]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:20)]);

    elseif size_cut(1) == 3
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:20)]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:20)]);

    else
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:20)]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:20)]);

    end

    limits = sortrows(unique(fix(26*rand(4,1)+2+20)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_3 = [mae(21:limits(1)); pai(limits(1)+1 : (50))];
        filho2_3 = [pai(21:limits(1)); mae(limits(1)+1 : (50))];

    elseif size_cut(1) == 2
        filho1_3 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:50)]);
        filho2_3 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:50)]);

    elseif size_cut(1) == 3
        filho1_3 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:50)]);
        filho2_3 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:50)]);

    else
        filho1_3 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:50)]);
        filho2_3 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:50)]);

    end 
    
    filho1 = [filho1_1; filho1_2; filho1_3]';
    filho2 = [filho2_1; filho2_2; filho2_3]';
    
end