function relative_cumulative_fitness = get_relative_cumulative_fitness( population )
    total_fitness = sum([population(:).fitness]);
    relative_fitness = [population(:).fitness] / total_fitness;
    relative_cumulative_fitness = cumsum(relative_fitness);
end
