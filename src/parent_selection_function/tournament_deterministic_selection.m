function parents = tournament_deterministic_selection( population, K, ~ )
    population_fitness = calculate_population_fitness(population);
    indexes = zeros(K);
    m = 2; %TODO add it to the config file
    

    for i = 1:K
        % Obtain a random sample from the population
        random_indexes = randi([1 length(population)], m, 1);
        % Get the index of the max fitness in the sample taken
        index_max = get_max_fitness_index(population_fitness, ...
            random_indexes);
        indexes(i) = index_max;
    end

    parents = population(indexes);
end

function index_max = get_max_fitness_index( population_fitness, ...
    random_indexes )
    
    index_max = random_indexes(1);
    max = population_fitness(random_indexes(1)).fitness;
    
    for i = 2:length(random_indexes)
        index_curr = random_indexes(i);
        curr = population_fitness(index_curr).fitness;
        
        if (curr > max)
            max = curr;
            index_max = index_curr;
        end
    end
end