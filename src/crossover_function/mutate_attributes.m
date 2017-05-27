function [height, items_set] = mutate_attributes(attributes, mutation_probability)
    config = get_config('main');
    min_height = config.min_height;
    max_height = config.max_height;
    all_items = load_items();
    
    [height, items_set] = unwrap_cell_attributes(attributes);
    
    if rand() < mutation_probability
        height = choose_random_height(min_height, max_height);
    end    
    items_set = mutate_items_set(items_set, all_items, mutation_probability);
end

%% Private Functions
function items_set = mutate_items_set(items_set, all_items, mutation_probability)
    if rand() < mutation_probability
        items_set.boots = datasample(all_items('boots'), 1);
    end
    if rand() < mutation_probability
        items_set.chest = datasample(all_items('chests'), 1);
    end
    if rand() < mutation_probability
        items_set.gloves = datasample(all_items('gloves'), 1);
    end
    if rand() < mutation_probability
        items_set.helmet = datasample(all_items('helmets'), 1);
    end
    if rand() < mutation_probability
        items_set.weapon = datasample(all_items('weapons'), 1);
    end
end

function height = choose_random_height(min, max)
    height = (max-min)*rand() + min;
end
