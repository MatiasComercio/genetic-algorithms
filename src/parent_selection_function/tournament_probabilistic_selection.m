function parents = tournament_probabilistic_selection( population, K, ~ )
    population_fitness = calculate_population_fitness(population);
    m = 2; %TODO add it to the config file
    randoms = rand(K,1);
    indexes = zeros(K);

    for i = 1:K
        random_indexes = randi([1 length(population)], m, 1);
        [index_min, index_max] = get_bounds_fitness_index( ...
            population_fitness, random_indexes);
        
        if (randoms(i) < 0.75)
            indexes(i) = index_max;
        else
            indexes(i) = index_min;
        end
    end

    parents = population(indexes);
end

function [index_min, index_max] = get_bounds_fitness_index( ...
    population_fitness, random_indexes )
    
    index_min = random_indexes(1);
    min = population_fitness(random_indexes(1)).fitness;
    
    index_max = random_indexes(1);
    max = population_fitness(random_indexes(1)).fitness;
    
    for i = 2:length(random_indexes)
        index_curr = random_indexes(i);
        curr = population_fitness(curr_index).fitness;
        
        % Check if min value needs to be updated
        if (curr_fitness < min)
            min = curr;
            index_min = index_curr;
        end
        
        % Check if max value needs to be updated
        if (curr_fitness > max)
            max = curr;
            index_max = index_curr;
        end
    end
end