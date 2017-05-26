config = get_config('main');
N = config.N;
fitness_function = config.fitness_function;
stats_multiplier = config.stats_multiplier;
min_height = config.min_height;
max_height = config.max_height;
parent_selection_function = config.parent_selection_function;

population = initialize_population(N, fitness_function, stats_multiplier, min_height, max_height);
population_fitness = calculate_population_fitness(population);

finished = false;
while ~finished
    %The main idea is:
    parents = parent_selection_function(population, population_fitness, K);    
    
    %children = cross_over_parents(parents);
    %children = mutate(children);
    %population = horzconcat(parent, children);
    %population_fitness = calculate_population_fitness(population);
    %population = replace_population(population, population_fitness);
    %finished = isFinished(population, population_fitness);
    finished = true; %TODO DELETE!!
end