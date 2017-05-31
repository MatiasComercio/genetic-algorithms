function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        case 'main'
            out.N = 100; % Population Size
            % Parent Selection Amount
            % Note that if using replace_population_function is
            % @replace_all_parents, this value should be set equal to N
            out.K = 70;
            out.min_height = 1.3;
            out.max_height = 2;
            % Probability that 2 given parents will cross
            out.crossover_probability = .8;
            % Probability that a given child attribute will mutate
            % (normally: 0.003)
            out.mutation_probability = 0.003;
            
            % Possible: assassin_fitness
            %           defender_fitness
            %           ranger_fitness
            %           warrior_fitness
            out.fitness_function = @assassin_fitness;
            
            % Possible: exponential_temperature
            out.temperature_function = @exponential_temperature;
            out.temperature_initial = NaN;
            % Possible: elite_selection
            %           roulette_selection
            %           universal_selection
            %           boltzmann_selection
            %           tournament_deterministic_selection
            %           tournament_probabilistic_selection
            %           ranking_selection
            out.parent_selection_function_1 = @elite_selection;
            out.parent_selection_function_2 = @roulette_selection;
            out.replace_selection_function_1 = @elite_selection;
            out.replace_selection_function_2 = @roulette_selection;

            % Percentage of first parent selection function to be taken
            out.A = .10;
            % Percentage of first replace selection function to be taken
            out.B = .10;

            % Possible: one_point_crossover
            %           two_point_crossover
            %           annular_crossover
            %           uniform_crossover
            %
            % Note: For uniform_crossover, replace configure the desired
            % probability in the corresponding case in this file
            % (probability that 2 given parent's attributes will swap)
            out.crossover_function = @uniform_crossover;
            
            % Possible: replace_all_parents
            %           replace_with_all_children
            %           replace_mixed
            %           generational_gap
            out.replace_population_function = @generational_gap;
            % Replacement Amount (used only if replace_population_function
            % is @replace_mixed (method 3)
            out.k_replace = 10;
            % Generational Gap (used only if
            % replace_population_function is @generational_gap)
            % Consider generating the correct amout of children for this
            % algorithm to be able to run
            out.G = 0.7;
            
            % Possible: generations_limit_reached
            %           fitness_threshold_reached
            %           max_fitness_stucked
            %           population_stucked
            out.have_to_finish_function = @population_stucked;
            
            % Multiplier Corresponding to the Assassin 3 Class
            out.stats_multiplier = struct;
            out.stats_multiplier.strength = 0.9;
            out.stats_multiplier.agility = 0.9;
            out.stats_multiplier.expertise = 1;
            out.stats_multiplier.resistance = 1.1;
            out.stats_multiplier.vitality = 1;
        case 'tournament_selection'        
            out.m = 2;
            out.random_limit = 0.75;
        case 'uniform_crossover'
            out.p = 0.5;
        % Variables for have_to_finish_functions
        case 'max_generations'
            out.max_generations = 10000;
        case 'fitness_threshold_reached'
            % Ideal expected fitness
            out.fitness_threshold = 20.30;
        case 'max_fitness_stucked'
            % How many previous generations will be consider to evaluate
            % the evolution of the max fitness on the population
            out.i_generations_gap = 15;
            % Which is the lower expected variation of the max fitness of
            % the populatio along the i_generation_gap generations
            % (note that both positive and negative values are possible,
            % but negative values don't have much sense)
            out.expected_delta_threshold = .02;
        case 'population_stucked'
            % How many previous generations will be consider to evaluate
            % the amount of individuals that changed on the population
            out.i_generations_gap = 15;
            % Which is the lower expected percentage variation of the
            % individuals of the populatio along the i_generation_gap 
            % generations. Possible values in range [0 ; 1]
            out.expected_percentage_threshold = .05;
        otherwise
            error('%s config not found', upper(input_string));
    end
end
