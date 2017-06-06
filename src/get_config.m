function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        % Configuration to specify the `get_config.m` containing folder and
        %   the folder where the output of each run should be saved.
        % Please take into account that output is overwritten each time a
        %   new run is saved.
        case 'folders'
            out.config_folder = 'src';
            out.output_folder = 'out';
        % Items files configuration
        % Note: it is assumed that all files have the same length (i.e.:
        %   all items files have the same amount of items)
        % It is important to specify the items folder and to specify their
        %   names and the last_row, being it the ammount of items that each
        %   file contains (in case of fulldata files, each file contains
        %   1000000 items, so it should be `out.last_row = 1000000;`)
        case 'items_files'
            out.items_files_folder = 'items/';
            out.boots_file = 'botas.tsv';
            out.helmets_file = 'cascos.tsv';
            out.chests_file = 'pecheras.tsv';
            out.gloves_file = 'guantes.tsv';
            out.weapons_file = 'armas.tsv';
            out.first_row = 1;
            out.last_row = 1000000;
            out.first_col = 0;
            out.last_col = 5;
            % Columns indexes of the items specifications inside each file
            out.id = 1; % id
            out.strength = 2; % Fu
            out.agility = 3; % Ag
            out.expertise = 4; % Ex
            out.resistance = 5; % Re
            out.vitality = 6; % Vi
        case 'main'
            % Population Size
            out.N = 1000;
            % Parent Selection Amount
            % Note that if using replace_population_function is
            %   @replace_all_parents, this value should be set equal to N
            out.K = 900;
            % Height range
            out.min_height = 1.3;
            out.max_height = 2;
            % Probability that 2 given parents will cross
            out.crossover_probability = .95;
            % Probability that a given child attribute || child
            % (depending on the chosen mutate_function) will mutate
            out.mutation_probability = 5e-2;
            
            % Possible: assassin_fitness
            %           defender_fitness
            %           ranger_fitness
            %           warrior_fitness
            out.fitness_function = @assassin_fitness;
            
            % Multiplier Corresponding to the Assassin 3 Class
            out.stats_multiplier = struct;
            out.stats_multiplier.strength = 0.9;
            out.stats_multiplier.agility = 0.9;
            out.stats_multiplier.expertise = 1;
            out.stats_multiplier.resistance = 1.1;
            out.stats_multiplier.vitality = 1;

            % Parent (Crossover) & Replace Selection function
            % Possible: elite_selection
            %           roulette_selection
            %           universal_selection
            %           boltzmann_selection
            %           tournament_deterministic_selection
            %           tournament_probabilistic_selection
            %           ranking_selection
            out.parent_selection_function_1 = @elite_selection;
            out.parent_selection_function_2 = @boltzmann_selection;
            out.replace_selection_function_1 = @elite_selection;
            out.replace_selection_function_2 = @boltzmann_selection;

            % Percentage of first parent selection function to be taken
            out.A = 0.05;
            % Percentage of first replace selection function to be taken
            out.B = 0.05;

            % Crossover function
            % Possible: one_point_crossover
            %           two_point_crossover
            %           annular_crossover
            %           uniform_crossover
            %
            % Note: For uniform_crossover, configure the desired
            % probability in the corresponding case in this file
            % (search `crossover_probability` above)
            out.crossover_function = @two_point_crossover;
            
            % Mutation function
            % Possible: mutate_individual
            %           mutate_attributes
            % Description
            % - mutate_individual: Only a single attribute
            %   (chosen randomly)
            %   per individual will be mutated, with probability
            %   mutate_probability
            % - mutate_attributes: Probabily mutate_probability to mutate
            %   each attribute (i.e.: each gen)
            out.mutation_function = @mutate_attributes;

            % Replace function
            % Possible: replace_all_parents (replace method 1)
            %           replace_with_all_children (replace method 2)
            %           replace_mixed (replace method 3)
            %           generational_gap (generational gap replace method)
            % Considerations
            % - For replace_all_parents, K variable should be set equal to
            %     N
            % - For replace_mixed, k_replace variable should be set lower
            %     than N
            % - For generational_gap, round(N * G) should be <= K
            out.replace_population_function = @replace_with_all_children;

            % Replacement amount
            % Used only if replace_population_function is @replace_mixed
            % Please refer to `replace_population_function` comments
            out.k_replace = 900;

            % Generational Gap parameter
            % Used only if replace_population_function is @generational_gap
            % Please refer to `replace_population_function` comments
            out.G = 1;

            % Finish criteria function
            % Possible: generations_limit_reached
            %           fitness_threshold_reached
            %           max_fitness_stucked
            %           population_stucked
            %           poor_allele_diversity
            % Description
            % - generations_limit_reached: max_generations variable (set
            %   below) is reached
            % - fitness_threshold_reached: fitness_threshold variable (set
            %   below) is reached
            % - max_fitness_stucked: during a gap of i generations,
            %     max fitness hasn't changed (delta difference).
            %   Related variables: i_generations_gap,
            %     expected_percentage_threshold (see below)
            % - population_stucked: during a gap of i generations,
            %     population individuals hasn't changed (delta difference)
            %   Related variables: i_generations_gap,
            %     expected_percentage_threshold (see below)
            % - poor_allele_diversity: function takes all possible allels
            %     and gets the one that have
            %     the max uniqueness and compares it to max_diversity value
            %     (see below); if all allels values are lower than this
            %     threshold, the algorithm finishes
            out.have_to_finish_function = @generations_limit_reached;
            
            % Temperature function
            % Possible: exponential_temperature
            out.temperature_function = @exponential_temperature;

        % Variables related to the above functions
        case 'exponential_temperature'
            % Recommended values: T = exp(-generation .* .005 + 5) + 1,
            %   .005: x_multiply_constant
            %   5: x_add_constant
            %   1: exp_add_constant
            out.x_multiply_constant = .005;
            out.x_add_constant = 5;
            out.exp_add_constant = 1;

        % Variables for some selection functions
        case 'tournament_selection'        
            out.m = 2;
            out.random_limit = 0.75;
        case 'uniform_crossover'
            out.p = 0.5;

        % Variables for have_to_finish_functions
        case 'max_generations' % a.k.a.: generation_limit_reached function
            out.max_generations = 2500;
        case 'fitness_threshold_reached'
            % Ideal expected fitness
            out.fitness_threshold = 20.30;
        case 'max_fitness_stucked'
            % How many previous generations will be consider to evaluate
            % the evolution of the max fitness on the population
            out.i_generations_gap = 500;
            % Which is the lower expected variation of the max fitness of
            % the populatio along the i_generation_gap generations
            % (note that both positive and negative values are possible,
            % but negative values don't have much sense)
            out.expected_delta_threshold = .001;
        case 'population_stucked'
            % How many previous generations will be consider to evaluate
            % the amount of individuals that changed on the population
            out.i_generations_gap = 15;
            % Which is the lower expected percentage variation of the
            % individuals of the populatio along the i_generation_gap 
            % generations. Possible values in range [0 ; 1]
            out.expected_percentage_threshold = .05;
        case 'poor_allele_diversity'
            out.max_diversity = 15;
        otherwise
            error('%s config not found', upper(input_string));
    end
end
