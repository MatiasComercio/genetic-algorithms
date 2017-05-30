function parents = tournament_deterministic_selection( population, K, ~ )
    config = get_config('tournament_selection');
    m = config.m;

    indexes = zeros(K,1);
    for i = 1:K
        % Obtain a random sample of indexes from the population
        population_sample_indexes = randsample(length(population), m);
        population_sample = population(population_sample_indexes);
        % Get the index of the max fitness in the sample taken
        [~, population_sample_max_index] = max([population_sample(:).fitness]);
        
        % Obtain the index of the individual in population and store it
        % in the array indexes.
        % The index is stored in the population_indexes_sample.
        % max_value_index is the index in which the index of
        % the individual is stored
        indexes(i) = population_sample_indexes(population_sample_max_index);
    end

    parents = population(indexes);
end
