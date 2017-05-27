function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        case 'main'
            out.N = 10; % Population Size
            out.K = 2; % Parent Selection Amount
            out.min_height = 1.3;
            out.max_height = 2;
            
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
            %           deterministic_tournament_selection
            %           probabilistic_tournament_selection
            %           ranking_selection
            out.parent_selection_function = @elite_selection;
            
            % Possible: @(parent1, parent2) one_point_crossover(parent1, parent2, point)
            %           @(parent1, parent2) two_point_crossover(parent1, parent2, point1, point2)
            %           @(parent1, parent2) uniform_crossover(parent1, parent2, point1, length)
            %           @(parent1, parent2) annular_crossover(parent1, parent2, probability)
            %
            % Usage: Replace 'point' (between 1 and 6), 'length' (between 1 and 5) and 'probability' with the
            % desired constants
            out.crossover_function = @(parent1, parent2) one_point_crossover(parent1, parent2, 3);
            
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