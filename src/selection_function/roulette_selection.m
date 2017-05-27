function parents = roulette_selection(population, K, ~)
    indexes = zeros(K,1);
    
    relative_cumulative_fitness = get_relative_cumulative_fitness(population);    
    
    for i = 1:K
        r_i = rand();
        
        % Find the first element which is greater than r_i
        % and return its index, which corresponds to the
        % index of the individual. This works because the
        % array is in ascending order.
        indexes(i) = find(relative_cumulative_fitness > r_i, 1);
    end
    
    parents = population(indexes);
end
