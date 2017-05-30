function relative_cumulative_fitness = get_relative_cumulative_fitness( population )
    len = length(population);
    relative_cumulative_fitness = zeros(len, 1);
    
    total_fitness = sum([population(:).fitness]);
    
    current_cumulative_fitness = 0;
    for i=1:len
        relative_fitness = population(i).fitness / total_fitness;
        current_cumulative_fitness = current_cumulative_fitness ...
            + relative_fitness;
        relative_cumulative_fitness(i) = current_cumulative_fitness;
    end
end
