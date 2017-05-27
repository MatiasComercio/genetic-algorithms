function [child1, child2] = one_point_crossover(parent1, parent2, mutation_probability)
    % Attributes order is considered as follows:
    % parent = [height, boots, chest, gloves, helmet, weapon]
    
    parent1_attributes = {parent1.height, parent1.items_set.boots, parent1.items_set.chest, ...
        parent1.items_set.gloves, parent1.items_set.helmet, parent1.items_set.weapon};
    
    parent2_attributes = {parent2.height, parent2.items_set.boots, parent2.items_set.chest, ...
        parent2.items_set.gloves, parent2.items_set.helmet, parent2.items_set.weapon};
    
    point = rand_int(1, length(parent1_attributes));
    
    [child1, child2] = new_children(parent1_attributes, parent2_attributes, point, parent1.fitness_function, parent1.stats_multiplier, mutation_probability);
end

%% Private Functions
function [child1, child2] = new_children(parent1, parent2, point, fitness_function, stats_multiplier, mutation_probability)
    for i=1:point-1
        attributes1(i) = parent1(i);
        attributes2(i) = parent2(i);
    end
    
    for i=point:length(parent1)
        attributes1(i) = parent2(i);
        attributes2(i) = parent1(i);
    end
    
    [height1, items_set1] = mutate_attributes(attributes1, mutation_probability);
    child1 = new_character(height1, items_set1, fitness_function, stats_multiplier);
    
    [height2, items_set2] = mutate_attributes(attributes2, mutation_probability);
    child2 = new_character(height2, items_set2, fitness_function, stats_multiplier);
end
