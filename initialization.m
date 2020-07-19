function [ population ] = initialization(N, size_I1, size_I2, size_rules, size_out)
    population = zeros(size_I1 + size_I2 + size_rules + size_out, N);
    for n = 1 : N
        I1 = sort(30*(rand(size_I1, 1)- 0.5));
        I2 = sort(rand(size_I2, 1)- 0.5);
        rules = 2 * rand(size_rules, 1);
        output = sort(rand(size_out, 1)- 0.5);
        cromossomo = [I1.' I2.' rules.' output.'];
        population(:,n) = cromossomo;
    end
end