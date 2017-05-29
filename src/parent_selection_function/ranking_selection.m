function parents = ranking_selection( population, K, ~ )
    population_fitness = calculate_population_fitness(population);
    % Get all the fitness fields so that it can be sorted
    
    [~, fitness_sort_indexes] = sort([population_fitness.fitness]);
    
    % Choose K values in which each individual 
    % is selected with probability i stored in the weights
    indexes = randsample(fitness_sort_indexes, K, true, ...
        1:length(fitness_sort_indexes));
    
    parents = population(indexes);
end
