function parents = tournament_probabilistic_selection( population, K, ~ )
    config = get_config('tournament_selection');
    m = config.m;
    random_limit = config.random_limit;
    
    population_indexes = 1:length(population);
    population_fitness = calculate_population_fitness(population);

    indexes = zeros(K);
    for i = 1:K
        % Obtain a random sample of indexes from the population
        population_indexes_sample = randsample(population_indexes, m);
        population_fitness_sample = ...
            population_fitness(population_indexes_sample);
        % Get the index of the max or min fitness in the sample taken
        if (rand() < random_limit)
            [~, curr_value_index] = max([population_fitness_sample.fitness]);
        else
            [~, curr_value_index] = min([population_fitness_sample.fitness]);
        end
        
        indexes(i) = population_indexes_sample(curr_value_index);
    end

    parents = population(indexes);
end
