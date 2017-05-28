function parents = roulette_selection(population, K, ~)
    population_fitness = calculate_population_fitness(population);    
    indexes = zeros(K);
    randoms = rand(K,1);
    accumulated_fitness = [population_fitness(:).acumulated_fitness];
    
    for i = 1:K
        r_i = randoms(i);
        indexes(i) = find(accumulated_fitness > r_i, 1);
    end
    
    parents = population(indexes);
end
