function [height, items_set] = mutate_attributes(attributes, ...
    mutation_probability, all_data)
    config = get_config('main');
    min_height = config.min_height;
    max_height = config.max_height;
    
    [height, items_set] = unwrap_cell_attributes(attributes);
    
    if rand() < mutation_probability
        height = rand_double(min_height, max_height);
    end    
    items_set = mutate_items_set(all_data, items_set, mutation_probability);
end

%% Private Functions
function items_set = mutate_items_set(all_data, ...
    items_set, mutation_probability)

    items_set.boots = mutate_item(all_data, 'boots', ...
        items_set.boots, mutation_probability);
    items_set.chest = mutate_item(all_data, 'chests', ...
        items_set.chest, mutation_probability);
    items_set.gloves = mutate_item(all_data, 'gloves', ...
        items_set.gloves, mutation_probability);
    items_set.helmet = mutate_item(all_data, 'helmets',...
        items_set.helmet, mutation_probability);
    items_set.weapon = mutate_item(all_data, 'weapons', ...
        items_set.weapon, mutation_probability);
end

function item = mutate_item(all_data, item_name, old_item, ...
    mutation_probability)
    if rand() < mutation_probability
        item = load_sample_item(all_data, item_name);
    else
        item = old_item;
    end
end
