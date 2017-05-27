function fitness = defender_fitness(atk, def)
    fitness = 0.1 * atk + 0.9 * def;
end