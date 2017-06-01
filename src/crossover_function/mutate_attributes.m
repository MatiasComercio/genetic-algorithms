function [height, items_set] = mutate_attributes(attributes, ...
    mutation_probability, all_data)
    config = get_config('main');
    min_height = config.min_height;
    max_height = config.max_height;    
    [height, items_set] = unwrap_cell_attributes(attributes);
    file_names = {'boots', 'chests', 'gloves', 'helmets', 'weapons'};
    items_names = {'boots', 'chest', 'gloves', 'helmet', 'weapon'};
    
    if rand() < mutation_probability
        % Only a single attribute (chosen randomly) will be mutated
        attributes_index = randi(length(attributes));
        if(attributes_index == 1)
            height = rand_double(min_height, max_height);
        else
            file_name = file_names{attributes_index-1};
            item_name = items_names{attributes_index-1};
            items_set.(item_name) = load_sample_item(all_data, file_name);
        end
    end    
end
