function finish = population_stucked(population, generation)
  % Check if there has been a long time since there hadn't been important 
  % changes on the population individuals
  persistent last_i_generations_ids;
  config = get_config('population_stucked');
  i_generations_gap = config.i_generations_gap;
  expected_percentage_threshold = config.expected_percentage_threshold;
  % Default: don't finish
  finish = false;
  last_index = get_circular_index(generation, i_generations_gap);
  % Sort by id for later use
  last_i_generations_ids(last_index) = sort([population(:).id]);
  % If we have not cycled at least once over all possible values of the 
  % gap, we should not evaluate this condition yet
  if i_generations_gap > generation
    return;
  end
  % Else, we should check whether there have been siginificant changes
  % on the population individuals over the last i generations
  % As population ids per generation were saved sorted and arrays have all
  % the same size (N), we can subtract the current generation ids with the
  % 'i prior' generation ids (i.e., the next one to be overwritten)
  first_index = get_circular_index(generation + 1, i_generations_gap);
  current_ids = last_i_generations_ids(last_index);
  i_previous_ids = last_i_generations_ids(first_index);
  % Count changed individuals and divide it with the total
  % possibilities of changes (length)
  changed_percentage = count_diff(current_ids, i_previous_ids) ...
      / length(current_ids);
  % If changes were less than expected, finish the algorithm
  if changed_percentage < expected_percentage_threshold
    finish = true;
  end
end
