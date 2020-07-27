function [ filho1, filho2 ] = crossover(mae, pai)
    
    limits = sortrows(unique(fix(9*rand(4,1)+2)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : (13))]);
        filho2 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : (13))]);

        filho1 = [filho1; mae(14:50)]';
        filho2 = [filho2; pai(14:50)]';

    elseif size_cut(1) == 2
        filho1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:13)]);
        filho2 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:13)]);

        filho1 = [filho1; mae(14:50)]';
        filho2 = [filho2; pai(14:50)]';

    elseif size_cut(1) == 3
        filho1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:13)]);
        filho2 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:13)]);

        filho1 = [filho1; mae(14:50)]';
        filho2 = [filho2; pai(14:50)]';
    else
        filho1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:13)]);
        filho2 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:13)]);

        filho1 = [filho1; mae(14:50)]';
        filho2 = [filho2; pai(14:50)]';
    end

    limits = sortrows(unique(fix(3*rand(4,1)+2+13)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : (20))]);
        filho2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : (20))]);

        filho1 = [pai(1:13); filho1; mae(21:50)]';
        filho2 = [mae(1:13); filho2; pai(21:50)]';

    elseif size_cut(1) == 2
        filho1 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:20)]);
        filho2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:20)]);

        filho1 = [pai(1:13); filho1; mae(21:50)]';
        filho2 = [mae(1:13); filho2; pai(21:50)]';

    elseif size_cut(1) == 3
        filho1 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:20)]);
        filho2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:20)]);

        filho1 = [pai(1:13); filho1; mae(21:50)]';
        filho2 = [mae(1:13); filho2; pai(21:50)]';
    else
        filho1 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:20)]);
        filho2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:20)]);

        filho1 = [pai(1:13); filho1; mae(21:50)]';
        filho2 = [mae(1:13); filho2; pai(21:50)]';
    end

    limits = sortrows(unique(fix(26*rand(4,1)+2+20)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1 = [mae(21:limits(1)); pai(limits(1)+1 : (50))];
        filho2 = [pai(21:limits(1)); mae(limits(1)+1 : (50))];

        filho1 = [pai(1:13); mae(14:20); filho1]';
        filho2 = [mae(1:13); pai(14:20); filho2]';

    elseif size_cut(1) == 2
        filho1 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:50)]);
        filho2 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:50)]);

        filho1 = [pai(1:13); mae(14:20); filho1]';
        filho2 = [mae(1:13); pai(14:20); filho2]';

    elseif size_cut(1) == 3
        filho1 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:50)]);
        filho2 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:50)]);

        filho1 = [pai(1:13); mae(14:20); filho1]';
        filho2 = [mae(1:13); pai(14:20); filho2]';
    else
        filho1 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:50)]);
        filho2 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:50)]);

        filho1 = [pai(1:13); mae(14:20); filho1]';
        filho2 = [mae(1:13); pai(14:20); filho2]';
    end    
end