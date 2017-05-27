function parents = tournament_deterministic_selection( population, K, ~ )
    m = 2; %TODO add it to the config file
    
    population_indexes = 1:length(population);
    population_fitness = calculate_population_fitness(population);

    indexes = zeros(K);
    for i = 1:K
        % Obtain a random sample of indexes from the population
        population_indexes_sample = randsample(population_indexes, m);
        population_fitness_sample = ...
            population_fitness(population_indexes_sample);
        % Get the index of the max fitness in the sample taken
        [~, max_value_index] = max([population_fitness_sample.fitness]);
        indexes(i) = population_sample_indexes(max_value_index);
    end

    parents = population(indexes);
end
