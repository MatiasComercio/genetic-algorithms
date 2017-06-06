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
T = 0; % Currently previous value is unused
update_temperature = config.temperature_function;
% Crossover variables
K = config.K;
crossover_probability = config.crossover_probability;
mutation_function = config.mutation_function;
mutation_probability = config.mutation_probability;
parent_selection_function = selection_function_builder(...
    config.parent_selection_function_1, ...
    config.parent_selection_function_2, config.A);
crossover_function = crossover_function_builder(...
    config.crossover_function, mutation_function);
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
    generation = 0;
end
% Global variable used to handle user's keyboard input to finish
% the algorithm main loop (event handled on current plot)
global USER_STOP;
USER_STOP = false;

% Loop until the expected finsish condition is met
while ~have_to_finish_function(population, generation) && ~USER_STOP
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
% Save current workspace for future usage
folders_config = get_config('folders');
output_folder = folders_config.output_folder;
% Delete output dir if it previously existed
if exist(output_folder, 'dir')
  rmdir(output_folder, 's');
end
% Create output dir
mkdir(output_folder);
% Copy current config file
config_folder = folders_config.config_folder;
config_in_file = strcat(config_folder, '/get_config.m');
config_out_file = strcat(output_folder, '/get_config.m');
copyfile(config_in_file, config_out_file);
% Save environment variables. Do not save: all_data
save(strcat(output_folder, '/workspace_backup'), '-regexp', '^(?!(all_data)$).');
% Save figure as .fig, .png and .eps
savefig(strcat(output_folder, '/fitness.fig'));
saveas(gcf, strcat(output_folder, '/fitness.png'));
print(strcat(output_folder, '/fitness.eps'), '-depsc');
