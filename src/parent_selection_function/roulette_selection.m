function parents = roulette_selection(population, K, ~)
    population_fitness = calculate_population_fitness(population);    
    indexes = zeros(K);
    randoms = rand(K,1);
    
    for i = 1:K
        r_i = randoms(i);
        
        prev_cum_population_fitness = 0;
        % Check if for any individual the r_i is bounded between
        % the current fitness cumsum and the previous fitness cumsum
        for j = 1:length(population)
            curr_cum_population_fitness = ...
                population_fitness(j).acumulated_fitness;
        
            if (prev_cum_population_fitness < r_i && ...
                    r_i < curr_cum_population_fitness)
                indexes(i) = j;
                
                % Stop searching for an individual with the current r_i
                break;
            end
            
            prev_cum_population_fitness = curr_cum_population_fitness;
        end
    end
    
    parents = population(indexes);
end
