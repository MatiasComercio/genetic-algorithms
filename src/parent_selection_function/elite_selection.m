function parents = elite_selection(population, population_fitness, K)    
    %Returns the sorted set and it's indexes in the original array
    [~, indexes] = sort([population_fitness.fitness], 'descend');
    parents = population(indexes(1:K));
end