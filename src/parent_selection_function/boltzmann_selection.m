function parents = boltzmann_selection( population, K, T )

    population_fitness = calculate_population_fitness(population);
    % Calc exptected values
    exp_aux = exp.^([population_fitness.fitness]./T);
    expected_values = exp_aux ./ mean(exp_aux);
    
    % Sort the expected values from high to low
    % and get the indexes of the original expected values
    [sort_expected_values, sort_expected_values_indexes] = ...
        sort(expected_values, 'descend');
    
    % Get cumulated fitness
    F = sum([population_fitness(:).fitness]);
    
    % Get K random values in [0,F]
    randoms = F .* rand(K,1);
    
    % Iterate over all the random values
    indexes = zeros(K,1);
    for i = 1:K
        r_i = randoms(i);
        
        sort_index = find(r_i < sort_expected_values, 1);
        indexes(i) = sort_expected_values_indexes(sort_index);
    end
    
    parents = population(indexes);
end
