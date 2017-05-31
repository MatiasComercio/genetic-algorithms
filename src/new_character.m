function character = new_character( height, items_set, fitness_function, stats_multiplier )
    character = struct;
    character.id = get_new_id;
    character.height = height;
    character.items_set = items_set;
    character.stats_multiplier = stats_multiplier;
    character.fitness_function = fitness_function;
    character.fitness = calculate_fitness(height, fitness_function, ...
        items_set, stats_multiplier);
    character.to_string = @(character) (character_to_string(character));
end

%% Private Functions
function string = character_to_string(character)
  format long;
  items_set = character.items_set;
  string = sprintf("Height: %f, Boots: %i, Chest: %i, Gloves: %i, Helmet: %i, Weapon: %i", character.height, ...
    items_set.boots.id, items_set.chest.id, items_set.gloves.id, items_set.helmet.id, items_set.weapon.id);
  format short;
end

function id = get_new_id()
  global id_counter;
  if isempty(id_counter)
    id_counter = 0;
  end
  id_counter = id_counter + 1;
  id = id_counter;
end

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
    
    raw_character_stats.vitality = (items_set.boots.vitality + items_set.chest.vitality + items_set.gloves.vitality + ...
        items_set.helmet.vitality + items_set.weapon.vitality) * stats_multiplier.vitality;
end

function character_stats = calculate_character_stats(raw_stats)
    % Max possible value = 100
    character_stats.strength = 100 * tanh(0.01 * raw_stats.strength);
    % Max possible value = 1
    character_stats.agility = tanh(0.01 * raw_stats.agility);
    % Max possible value = 0.6
    character_stats.expertise = 0.6 * tanh(0.01 * raw_stats.expertise);
    % Max possible value = 1
    character_stats.resistance = tanh(0.01 * raw_stats.resistance);
    % Max possible value = 100
    character_stats.vitality = 100 * tanh(0.01 * raw_stats.vitality);
end

function attack = calculate_attack(h, stats)
    % Global max: h = 1.9152 => atk(h) ~= 1.7045
    attack_modifier = 0.5 - ( 3 * h - 5 )^4 + ( 3 * h - 5 )^2 + h/2;
    % Max possible value ~= (1 + 0.6) * 100 * 1.71 = 273.6
    attack = (stats.agility + stats.expertise) * stats.strength * attack_modifier;
end

function defense = calculate_defense(h, stats)
    % Global max: h = 1.6393 => atk(h) ~= 1.1736
    defense_modifier = 2 + ( 3 * h - 5 )^4 - ( 3 * h - 5 )^2 - h/2;
    % Max possible value ~= (1 + 0.6) * 100 * 1.18 = 188.8
    defense = (stats.resistance + stats.expertise) * stats.vitality * defense_modifier;
end
