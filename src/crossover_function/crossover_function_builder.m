function crossover_function = crossover_function_builder(crossover_selected_function)
    crossover_function = @(parent1, parent2, mutation_probability) get_crossover_function(crossover_selected_function, ...
        parent1, parent2, mutation_probability);
end

%% Private Functions
function [child1, child2] = get_crossover_function(crossover_selected_function, parent1, parent2, mutation_probability)
    % Attributes order is considered as follows:
    % parent = [height, boots, chest, gloves, helmet, weapon]
    parent1_attributes = get_parent_attributes(parent1);
    parent2_attributes = get_parent_attributes(parent2);
    
    [child1_attributes, child2_attributes] = crossover_selected_function(parent1_attributes, parent2_attributes);
    
    % It's assumed that parent1 and parent2 share the same fitness_function
    % and stats_multiplier.
    child1 = new_child(child1_attributes, parent1.fitness_function, parent1.stats_multiplier, ...
        mutation_probability);
    child2 = new_child(child2_attributes, parent1.fitness_function, parent1.stats_multiplier, ...
        mutation_probability);
end

function parent_attributes = get_parent_attributes(parent)
    parent_attributes = {parent.height, parent.items_set.boots, parent.items_set.chest, ...
        parent.items_set.gloves, parent.items_set.helmet, parent.items_set.weapon};
end

function child = new_child(child_attributes, fitness_function, stats_multiplier, mutation_probability)
    [height, items_set] = mutate_attributes(child_attributes, mutation_probability);
    child = new_character(height, items_set, fitness_function, stats_multiplier);
end