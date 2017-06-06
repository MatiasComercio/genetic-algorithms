function children = parents_crossover(parents, crossover_function, ...
    crossover_probability, mutation_probability, all_data)
    K = length(parents);
    children(K) = parents(K);
    % Shuffle parents
    shuffled_parents = datasample(parents, K, 'Replace', false);
    for i=1:2:K
        if rand() < crossover_probability
            [child1, child2] = crossover_function(shuffled_parents(i), ...
                shuffled_parents(i+1), mutation_probability, all_data);
            children(i) = child1;
            children(i+1) = child2;
        else
            children(i) = shuffled_parents(i);
            children(i+1) = shuffled_parents(i+1);
        end
    end
end
