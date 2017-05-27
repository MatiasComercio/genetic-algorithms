function parents = boltzmann_selection( population, K, T )
    % Calc exptected values
    exp_aux = exp([population(:).fitness]./T);
    expected_values = exp_aux ./ mean(exp_aux);
    
    % Sort the expected values from high to low
    % and get the indexes of the original expected values
    [sort_expected_values, sort_expected_values_indexes] = ...
        sort(expected_values, 'descend');
    
    % Get cumulated fitness
    F = sum([population(:).fitness]);
    
    % Iterate over all the random values
    indexes = zeros(K,1);
    for i = 1:K
        % Random value in [0,F]
        r_i = F .* rand();
        
        sort_index = find(sort_expected_values > r_i, 1);
        indexes(i) = sort_expected_values_indexes(sort_index);
    end
    
    parents = population(indexes);
end
