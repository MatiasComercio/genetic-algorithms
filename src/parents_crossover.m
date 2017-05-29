function children = parents_crossover(parents, crossover_function, K, crossover_probability, mutation_probability)
    children(K) = parents(K);
    % Shuffle parents
    shuffled_parents = datasample(parents, length(parents), 'Replace', false);
    for i=1:2:K
        if rand() < crossover_probability
            [child1, child2] = crossover_function(shuffled_parents(i), shuffled_parents(i+1), mutation_probability);
            children(i) = child1;
            children(i+1) = child2;
        else
            children(i) = shuffled_parents(i);
            children(i+1) = shuffled_parents(i+1);
        end
    end
end
