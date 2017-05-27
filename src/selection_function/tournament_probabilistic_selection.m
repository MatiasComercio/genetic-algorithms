function parents = tournament_probabilistic_selection( population, K, ~ )
    config = get_config('tournament_selection');
    m = config.m;
    random_limit = config.random_limit;

    indexes = zeros(K,1);
    for i = 1:K
        % Obtain a random sample of indexes from the population
        population_sample_indexes = randsample(length(population), m);
        population_sample = population(population_sample_indexes);
        % Get the index of the max or min fitness in the sample taken
        if (rand() < random_limit)
            [~, population_sample_val_index] = ...
                max([population_sample(:).fitness]);
        else
            [~, population_sample_val_index] = ...
                min([population_sample(:).fitness]);
        end
        
        % Obtain the index of the individual in population and store it
        % in the array indexes.
        % The index is stored in the population_indexes_sample.
        % curr_value_index is the index in which the index of
        % the individual is stored
        indexes(i) = population_sample_indexes(population_sample_val_index);
    end

    parents = population(indexes);
end
