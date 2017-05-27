function parents = boltzmann_selection( population, K, T )
    
    population_fitness = calculate_population_fitness(population);
    expected_values = zeros(length(population));
    
    for i = 1:length(population)
        fitness_i = population_fitness(i).fitness;
        expected_values(i) = exp(fitness_i / T) / expected_value_poplation;
    end
    
    % Sort the expected values from high to low
    % and get the indexes of the original expected values
    [~, idx_sorted_expected_values] = sort(expected_values, 'descend');
    
    % Get cumulated fitness
    F = get_cum_fitness(population_fitness);
    
    % Get K random values in [0,F]
    randoms = F .* rand(K,1);
    % Initialize the indexes
    indexes = zeros(K);

    % Iterate over all the random values
    for i = 1:K
        r_i = randoms(i);
        
        for j = 1:length(population)
            % Get the index of the next highest expected value
            index = idx_sorted_expected_values(j);
            % Get the expected value of the original array
            expected_value = expected_values(index);
            
            if (r_i < expected_value)
                % Save the index of the parent
                indexes(i) = index;
                
                % Stop looking for the individual
                break;
            end
        end 
    end
    
    parents = population(indexes);
end

function cum_fitness = get_cum_fitness(population_fitness)
    cum_fitness = 0;

    for i = 1:length(population_fitness)
        cum_fitness = cum_fitness + population(i).fitness;
    end
end

