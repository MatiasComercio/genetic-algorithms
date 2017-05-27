function [child1, child2] = one_point_crossover(parent1, parent2, point)
    % Attributes order is considered as follows:
    % parent = [height, boots, chest, gloves, helmet, weapon]
    
    parent1_attributes = {parent1.height, parent1.items_set.boots, parent1.items_set.chest, ...
        parent1.items_set.gloves, parent1.items_set.helmet, parent1.items_set.weapon};
    
    parent2_attributes = {parent2.height, parent2.items_set.boots, parent2.items_set.chest, ...
        parent2.items_set.gloves, parent2.items_set.helmet, parent2.items_set.weapon};
    
    child1 = new_child(parent1_attributes, parent2_attributes, point, parent1.fitness_function, parent1.stats_multiplier);
    child2 = new_child(parent2_attributes, parent1_attributes, point, parent2.fitness_function, parent2.stats_multiplier);
end

%% Private Functions
function child = new_child(parent1, parent2, point, fitness_function, stats_multiplier)
    for i=1:point
        attributes(i) = parent1(i);
    end
    
    for i=point:length(parent1)
        attributes(i) = parent2(i);
    end
    
    height = cell2mat(attributes(1)); 
    boots_cell = cell2struct(attributes(2), 'boots');
    chest_cell = cell2struct(attributes(3), 'chest');
    gloves_cell = cell2struct(attributes(4), 'gloves');
    helmet_cell = cell2struct(attributes(5), 'helmet');
    weapon_cell = cell2struct(attributes(6), 'weapon');
    
    items_set.boots = boots_cell.boots;
    items_set.chest = chest_cell.chest;
    items_set.gloves = gloves_cell.gloves;
    items_set.helmet = helmet_cell.helmet;
    items_set.weapon = weapon_cell.weapon;
    
    child = new_character(height, items_set, fitness_function, stats_multiplier);
end