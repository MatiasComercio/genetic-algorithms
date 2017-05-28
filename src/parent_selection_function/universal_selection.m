function parents = universal_selection(population, K, ~)
    population_fitness = calculate_population_fitness(population);
    indexes = zeros(K);
    r = rand();
    
    % accumulated_fitness is in ascending order implicitly
    accumulated_fitness = [population_fitness(:).acumulated_fitness];
    for i = 1:K
        r_i = (r + i - 1) / K;
        % Find the first element which is gregater than r_i
        % and return its index, which corresponds to the
        % index of the individual
        indexes(i) = find(accumulated_fitness > r_i, 1);
    end
    
    parents = population(indexes);
end
