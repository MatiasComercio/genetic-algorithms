function parents = tournament_deterministic_selection( population, K, ~ )
    config = get_config('tournament_selection');
    m = config.m;
    
    population_indexes = 1:length(population);
    population_fitness = calculate_population_fitness(population);

    indexes = zeros(K);
    for i = 1:K
        % Obtain a random sample of indexes from the population
        population_indexes_sample = randsample(population_indexes, m);
        population_fitness_sample = ...
            population_fitness(population_indexes_sample);
        % Get the index of the max fitness in the sample taken
        [~, max_value_index] = max([population_fitness_sample(:).fitness]);
        
        % Obtain the index of the individual in population.
        % The index is stored in the population_indexes_sample.
        % max_value_index is the index in which the index of
        % the individual is stored
        indexes(i) = population_indexes_sample(max_value_index);
    end

    parents = population(indexes);
end
