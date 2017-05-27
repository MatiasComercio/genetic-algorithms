function parents = universal_selection(population, K, ~)
    population_fitness = calculate_population_fitness(population);
    indexes = zeros(K);
    random = rand();
    r = zeros(K);
    
    % Obtain the rest of the r's from the random value
    for j = 1:K
        r(j) = (random + j - 1) / K;
    end
    
    prev_cum_population_fitness = 0;
    for i = 1:K
        curr_cum_population_fitness = ...
            population_fitness(i).acumulated_fitness;
        r_i = r(i);
        
        % Check if for any individual the r_i is bounded between
        % the current fitness cumsum and the previous fitness cumsum
        for j = 1:length(population)
            if (prev_cum_population_fitness < r_i && ...
                    r_i < curr_cum_population_fitness)
                indexes(i) = j;
                
                % Stop searching for an individual with the current r_i
                break;
            end
        end
        
        prev_cum_population_fitness = ...
            curr_cum_population_fitness;
    end
    
    parents = population(indexes);
end