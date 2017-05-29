function parents = elite_selection(population, K, ~)    
    % Returns the sorted set and it's indexes in the original array
    [~, indexes] = sort([population(:).fitness], 'descend');
    parents = population(indexes(1:K));
end
