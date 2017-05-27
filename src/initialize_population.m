function population = initialize_population(population_size, fitness_function, stats_multiplier, min_height, max_height)
    all_items = load_items();
    for i=1:population_size
        items_set = choose_random_items_set(all_items);
        height = rand_double(min_height, max_height);
        population(i) = new_character(height, items_set, fitness_function, stats_multiplier);
    end        
end

%% Private Functions
function items_set = choose_random_items_set(all_items)
    items_set.boots = datasample(all_items('boots'), 1);
    items_set.chest = datasample(all_items('chests'), 1);
    items_set.gloves = datasample(all_items('gloves'), 1);
    items_set.helmet = datasample(all_items('helmets'), 1);
    items_set.weapon = datasample(all_items('weapons'), 1);
end
