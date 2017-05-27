function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        case 'main'
            out.N = 10; % Population Size
            out.K = 2; % Parent Selection Amount // MUST be even!
            out.min_height = 1.3;
            out.max_height = 2;
            out.crossover_probability = 1; % Probability that 2 given parents will cross
            out.mutation_probability = 0; % Probability that a given child attribute will mutate (normally: 0.003)
            
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
            out.parent_selection_function = @boltzmann_selection;
            
            % Possible: one_point_crossover
            %           two_point_crossover
            %           annular_crossover
            %           @(parent1, parent2, mutation_probability) uniform_crossover(parent1, parent2, mutation_probability, 0.5)
            %
            % Note: For uniform_crossover, replace '0.5' with the desired probability (probability that 
            % 2 given parent's attributes will swap)
            out.crossover_function = @one_point_crossover;
            
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
	otherwise
            error('%s config not found', upper(input_string));
    end
end