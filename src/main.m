config = get_config('main');
N = config.N;
K = config.K;
T = config.initial_T;
fitness_function = config.fitness_function;
stats_multiplier = config.stats_multiplier;
get_temperature = config.temperature_function;
min_height = config.min_height;
max_height = config.max_height;
parent_selection_function = config.parent_selection_function;
crossover_function = config.crossover_function;

population = initialize_population(N, fitness_function, stats_multiplier, min_height, max_height);
generation = 0;

finished = false;
while ~finished
    T = get_temperature(generation, T);
    parents = parent_selection_function(population, K, T);
    children = crossover_function(parents(1), parents(2)); %TODO: Choose combinations of parents to crossover
    %children = mutate(children);
    %population = horzconcat(parent, children);
    %population_fitness = calculate_population_fitness(population);
    %population = replace_population(population, population_fitness);
    %finished = isFinished(population, population_fitness);
    finished = true; %TODO DELETE!!
end
