function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        case 'main'
            out.N = 10;
            out.fitness_function = @assassin_fitness;
            out.min_height = 1.3;
            out.max_height = 2;
            
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