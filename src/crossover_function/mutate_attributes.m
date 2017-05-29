function [height, items_set] = mutate_attributes(attributes, mutation_probability)
    config = get_config('main');
    min_height = config.min_height;
    max_height = config.max_height;
    all_items = load_items();
    
    [height, items_set] = unwrap_cell_attributes(attributes);
    
    if rand() < mutation_probability
        height = rand_double(min_height, max_height);
    end    
    items_set = mutate_items_set(items_set, all_items, mutation_probability);
end

%% Private Functions
function items_set = mutate_items_set(items_set, all_items, mutation_probability)
    items_set.boots = mutate_item(all_items, 'boots', items_set.boots, mutation_probability);
    items_set.chest = mutate_item(all_items, 'chests', items_set.chest, mutation_probability);
    items_set.gloves = mutate_item(all_items, 'gloves', items_set.gloves, mutation_probability);
    items_set.helmet = mutate_item(all_items, 'helmets', items_set.helmet, mutation_probability);
    items_set.weapon = mutate_item(all_items, 'weapons', items_set.weapon, mutation_probability);
end

function item = mutate_item(all_items, item_name, old_item, mutation_probability)
    if rand() < mutation_probability
        item = datasample(all_items(item_name), 1);
    else
        item = old_item;
    end
end
