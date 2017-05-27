function parents = roulette_selection(population, K, ~)
    population_fitness = calculate_population_fitness(population);    
    indexes = zeros(K);
    randoms = rand(K,1);
    
    prev_cumulative_population_fitness = 0;
    for i = 1:K
        curr_cumulative_population_fitness = ...
            population_fitness(i).acumulated_fitness;
        r_i = randoms(i);
        
        for j = 1:length(population)
            if (prev_cumulative_population_fitness < r_i && ...
                    r_i < curr_cumulative_population_fitness)
                indexes(i) = j;
                break;
            end
        end
        
        prev_cumulative_population_fitness = ...
            curr_cumulative_population_fitness;
    end
    
    parents = population(indexes);
end

