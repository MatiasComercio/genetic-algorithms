function parents = ranking_selection( population, K, ~ )
    population_fitness = calculate_population_fitness(population);
    % Get all the fitness fields so that it can be sorted
    fitness_array = get_fitnesses(population_fitness);
    
    [~, fitness_sort_indexes] = sort(fitness_array);
    
    N = length(population_fitness);
    
    % Choose K values in which each individual 
    % is selected with probability i stored in the weights
    indexes = randsample(fitness_sort_indexes, K, true, 1:N);
    
    parents = population(indexes);
end

% Map the fitness field of all the individuals to an array
function fitness_array = get_fitnesses(population_fitness)
    fitness_array = zeros(length(population_fitness));

    for i = 1:length(population_fitness)
        fitness_array(i) = population_fitness(i).fitness;
    end
end

% [[
% S = 1 + 2 + 3 + 4 +.......n
% La fórmula es:
% S = n(n+1)/2
% ]]
% sort_collection(f(collection), 'asc').map((elem, index) => {
%   weight_elem = index/S;
% });