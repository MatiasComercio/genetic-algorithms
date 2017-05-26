function character = new_character( height, items_set, fitness_function, stats_multiplier )
    character = struct;
    character.height = height;
    character.items_set = items_set;
    character.stats_multiplier = stats_multiplier;
    character.fitness_function = fitness_function;
    character.fitness = @(character) calculate_fitness(character.height, character.fitness_function, character.items_set, ...
        character.stats_multiplier);
end

%% Private Functions
function fitness = calculate_fitness(height, fitness_function, items_set, stats_multiplier)
    raw_character_stats = calculate_raw_character_stats(items_set, stats_multiplier);
    character_stats = calculate_character_stats(raw_character_stats);
    atk = calculate_attack(height, character_stats);
    def = calculate_defense(height, character_stats);
    fitness = fitness_function(atk, def);
end

function raw_character_stats = calculate_raw_character_stats(items_set, stats_multiplier)
    raw_character_stats.strength = (items_set.boots.strength + items_set.chest.strength + items_set.gloves.strength + ...
        items_set.helmet.strength + items_set.weapon.strength) * stats_multiplier.strength;
    
    raw_character_stats.agility = (items_set.boots.agility + items_set.chest.agility + items_set.gloves.agility + ...
        items_set.helmet.agility + items_set.weapon.agility) * stats_multiplier.agility;
    
    raw_character_stats.expertise = (items_set.boots.expertise + items_set.chest.expertise + items_set.gloves.expertise + ...
        items_set.helmet.expertise + items_set.weapon.expertise) * stats_multiplier.expertise;
    
    raw_character_stats.resistance = (items_set.boots.resistance + items_set.chest.resistance + items_set.gloves.resistance + ...
        items_set.helmet.resistance + items_set.weapon.resistance) * stats_multiplier.resistance;
    
    raw_character_stats.resistance = (items_set.boots.vitality + items_set.chest.vitality + items_set.gloves.vitality + ...
        items_set.helmet.vitality + items_set.weapon.vitality) * stats_multiplier.vitality;
end

function character_stats = calculate_character_stats(raw_stats)
    character_stats.strength = 100 * tanh(0.01 * raw_stats.strength);
    character_stats.agility = tanh(0.01 * raw_stats.agility);
    character_stats.expertise = 0.6 * tanh(0.01 * raw_stats.expertise);
    character_stats.resistance = tanh(0.01 * raw_stats.resistance);
    character_stats.vitality = 100 * tanh(0.01 * raw_stats.vitality);
end

function attack = calculate_attack(h, stats)
    attack_modifier = 0.5 - ( 3 * h - 5 )^4 + ( 3 * h - 5 )^2 + h/2;
    attack = (stats.agility + stats.expertise) * stats.strength * attack_modifier;
end

function defense = calculate_defense(h, stats)
    defense_modifier = 2 + ( 3 * h - 5 )^4 - ( 3 * h - 5 )^2 - h/2;
    defense = (stats.resistance + stats.expertise) * stats.vitality * defense_modifier;
end