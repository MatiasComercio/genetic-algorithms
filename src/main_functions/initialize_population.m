function population = initialize_population(population_size, ...
    fitness_function, stats_multiplier, min_height, max_height, all_data)
    fake_parents_ids = [-2,-1];
    for i=1:population_size
        items_set = choose_random_items_set(all_data);
        height = rand_double(min_height, max_height);
        population(i) = new_character(height, items_set, fitness_function, stats_multiplier, fake_parents_ids);
    end        
end

%% Private Functions
function items_set = choose_random_items_set(all_data)
    items_set.boots = load_sample_item(all_data, 'boots');
    items_set.chest = load_sample_item(all_data, 'chests');
    items_set.gloves = load_sample_item(all_data, 'gloves');
    items_set.helmet = load_sample_item(all_data, 'helmets');
    items_set.weapon = load_sample_item(all_data, 'weapons');
end
