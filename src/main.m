% Load main config
config = get_config('main');

% Load data if not already loaded
if ~exist('all_data','var')
  all_data = load_data;
end

% General variables
N = config.N;
fitness_function = config.fitness_function;
stats_multiplier = config.stats_multiplier;
min_height = config.min_height;
max_height = config.max_height;
% Temperature variables
T = config.temperature_initial;
update_temperature = config.temperature_function;
% Crossover variables
K = config.K;
crossover_probability = config.crossover_probability;
mutation_probability = config.mutation_probability;
parent_selection_function = selection_function_builder(...
    config.parent_selection_function_1, ...
    config.parent_selection_function_2, config.A);
crossover_function = crossover_function_builder(config.crossover_function);
% Replace variables
k_replace = config.k_replace;
G = config.G;
replace_population_function = config.replace_population_function;
replace_selection_function = selection_function_builder(...
    config.replace_selection_function_1, ...
    config.replace_selection_function_2, config.B);
% Finish condition function
have_to_finish_function = config.have_to_finish_function;

% Start algorithm itself
% Generate initial conditions
% Take the first generation as the previous looped if it already exists
if ~exist('population','var')
    % Sadly, the only way to restore the id_counter for a matlab enviroment
    % without adding some parameters to more than 5 functions
    clear global id_counter;
    population = initialize_population(N, fitness_function, ...
        stats_multiplier, min_height, max_height, all_data);
end
generation = 0;
% Loop until the expected finsish condition is met
while ~have_to_finish_function(population, generation)
    % Plot current generation
    plot_population_fitness_stats(population, generation);
    % Update temperature
    T = update_temperature(generation, T);
    % Get parents for crossover
    parents = parent_selection_function(population, K, T);
    % Get children from crossover selected parents
    children = parents_crossover(parents, crossover_function, ...
        crossover_probability, mutation_probability, all_data);
    % Replace the population of the current generation
    population = replace_population_function(N, K, k_replace, G, ...
      T, replace_selection_function, population, children);
    % Move to next generation
    generation = generation + 1;
end
% Plot last generation
plot_population_fitness_stats(population, generation);
