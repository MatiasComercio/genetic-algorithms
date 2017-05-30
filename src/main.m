config = get_config('main');
N = config.N;
K = config.K;
T = config.temperature_initial;
crossover_probability = config.crossover_probability;
mutation_probability = config.mutation_probability;
fitness_function = config.fitness_function;
stats_multiplier = config.stats_multiplier;
get_temperature = config.temperature_function;
min_height = config.min_height;
max_height = config.max_height;
parent_selection_function = config.parent_selection_function;
crossover_function = crossover_function_builder(config.crossover_function);

population = initialize_population(N, fitness_function, stats_multiplier, min_height, max_height);
generation = 0;

finished = false;
while ~finished
    plot_population_fitness_stats(generation, population);
    T = get_temperature(generation, T);
    % TODO: implement a two-function-selection
    parents = parent_selection_function(population, K, T);
    children = parents_crossover(parents, crossover_function, crossover_probability, mutation_probability);
    %population = horzconcat(parent, children);
    %population_fitness = calculate_population_fitness(population);
    %population = replace_population(population, population_fitness);
    %finished = isFinished(population, population_fitness);
    finished = true; %TODO DELETE!!
    generation = generation + 1;
end
