function parents = tournament_probabilistic_selection( population, K, ~ )
    m = 2; %TODO add it to the config file
    
    population_indexes = 1:length(population);
    population_fitness = calculate_population_fitness(population);

    indexes = zeros(K);
    for i = 1:K
        % Obtain a random sample of indexes from the population
        population_indexes_sample = randsample(population_indexes, m);
        population_fitness_sample = ...
            population_fitness(population_indexes_sample);
        % Get the index of the max or min fitness in the sample taken
        if (rand() < 0.75)
            [~, curr_value_index] = max([population_fitness_sample.fitness]);
        else
            [~, curr_value_index] = min([population_fitness_sample.fitness]);
        end
        
        indexes(i) = curr_value_index;
    end

    parents = population(indexes);
end
