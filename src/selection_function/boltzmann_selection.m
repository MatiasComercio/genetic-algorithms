function parents = boltzmann_selection( population, K, T )
    % Calc exptected values
    exp_aux = exp([population(:).fitness]./T);
    expected_values = exp_aux ./ mean(exp_aux);
    % Accumulate expected values
    cum_expected_values = cumsum(expected_values);
    % Get max cum_expected_value (should be the last one)
    F = max(cum_expected_values);
    % Iterate over all random values (like roulette)
    indexes = zeros(K,1);
    for i = 1:K
        % Random value in [0,F]
        r_i = F .* rand();

        % Find the first element which is greater than r_i
        % and return its index, which corresponds to the
        % index of the individual. This works because the
        % array is in ascending order.
        indexes(i) = find(cum_expected_values > r_i, 1);
    end
    parents = population(indexes);
end
