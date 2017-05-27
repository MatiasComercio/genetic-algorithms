function parents = boltzmann_selection( population, K, T )

    population_fitness = calculate_population_fitness(population);
    population_mean = mean(exp.^([population_fitness.fitness]./T));
    % Calc exptected values
    expected_values = exp.^([population_fitness.fitness]./T) ./ ...
        population_mean;
    
    % Sort the expected values from high to low
    % and get the indexes of the original expected values
    [~, idx_sorted_expected_values] = sort(expected_values, 'descend');
    
    % Get cumulated fitness
    F = sum([population_fitness.fitness]);
    
    % Get K random values in [0,F]
    randoms = F .* rand(K,1);
    
    % Iterate over all the random values
    indexes = zeros(K);
    for i = 1:K
        r_i = randoms(i);
        
        for j = 1:length(expected_values)
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
