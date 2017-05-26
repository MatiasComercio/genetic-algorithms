function main()
    config = get_config('main');
    N = config.N;
    
    population = initialize_population(N);
    population_fitness = calculate_population_fitness(population);
    
    finished = false;
    while ~finished
        %The main idea is:
        %parents = select_parents(population);
        %children = cross_over_parents(parents);
        %children = mutate(children);
        %population = horzconcat(parent, children);
        %population_fitness = calculate_population_fitness(population);
        %population = replace_population(population, population_fitness);
    end
end