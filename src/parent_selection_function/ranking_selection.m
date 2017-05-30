function parents = ranking_selection( population, K, ~ )
    [~, fitness_sort_indexes] = sort([population(:).fitness]);
    
    % Choose K values in which each individual 
    % is selected with probability i stored in the weights
    indexes = randsample(fitness_sort_indexes, K, true, ...
        1:length(fitness_sort_indexes));
    
    parents = population(indexes);
end
