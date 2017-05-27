function children = parents_crossover(parents, crossover_function, K, crossover_probability, mutation_probability)    
    for i=1:2:K
        selected_parents = datasample(parents, 2, 'Replace', false); % Select 2 random parents
        if rand() < crossover_probability
            [child1, child2] = crossover_function(selected_parents(1), selected_parents(2), mutation_probability);
            children(i) = child1;
            children(i+1) = child2;
        else
            children(i) = selected_parents(1);
            children(i+1) = selected_parents(2);
        end
    end
end