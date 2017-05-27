function  population_fitness = calculate_population_fitness( population )
    len = length(population);
    population_fitness(len).fitness = 0;
    total_fitness = 0;
    for i=1:len
        individual_fitness = population(i).fitness(population(i));
        population_fitness(i).fitness = individual_fitness;
        total_fitness = total_fitness + individual_fitness;
    end

    acumulated_fitness = 0;

    for i=1:len
        relative_fitness = population_fitness(i).fitness/total_fitness;
        population_fitness(i).relative_fitness = relative_fitness;
        acumulated_fitness = acumulated_fitness + relative_fitness;
        population_fitness(i).acumulated_fitness = acumulated_fitness;
    end 
end
