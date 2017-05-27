function finish = population_stucked(population, generation)
  config = get_config('population_stucked');
  % Default: don't finish
  finish = false;
  % Check if there has been a long time since there hadn't been important
  % fitness improvements (regarding max_fitness)
  persistent last_i_generations;
  i_generations_gap = config.i_generations_gap;
  expected_percentage_threshold = config.expected_percentage_threshold;
  index = get_index(generation, i_generations_gap);
  next_index = get_index(index + 1, i_generations_gap);
  % Sort by id for later use
  last_i_generations(index).ids = sort([population(:).id]);
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
  current_ids = last_i_generations(index).ids;
  i_previous_ids = last_i_generations(next_index).ids;
  % Save if individuals have changed (0 if no; 1 if yes)
  diff_counter = (current_ids - i_previous_ids) ~= 0;
  % Count changed individuals (sum) and divide it with the total
  % possibilities of changes (length)
  changed_percentage = sum(diff_counter) / length(diff_counter);
  % If changes were less than expected, finish the algorithm
  if changed_percentage < expected_percentage_threshold
    finish = true;
  end
end

function index = get_index(i, divisor)
  index = mod(i, divisor) + 1;
end
