function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        case 'main'
            out.N = 10; %Population Size
            out.K = 2; %Parent Selection Amount
            out.min_height = 1.3;
            out.max_height = 2;
            
            % Possible: assassin_fitness
            %           defender_fitness
            %           ranger_fitness
            %           warrior_fitness
            out.fitness_function = @assassin_fitness;
            
            % Possible: elite_selection
            %           roulette_selection
            %           universal_selection
            %           boltzmann_selection
            %           deterministic_tournament_selection
            %           probabilistic_tournament_selection
            %           ranking_selection
            out.parent_selection_function = @elite_selection;
            
            % Multiplier Corresponding to the Assassin 3 Class
            out.stats_multiplier = struct;
            out.stats_multiplier.strength = 0.9;
            out.stats_multiplier.agility = 0.9;
            out.stats_multiplier.expertise = 1;
            out.stats_multiplier.resistance = 1.1;
            out.stats_multiplier.vitality = 1;
     otherwise
            error('%s config not found', upper(input_string));
    end
end