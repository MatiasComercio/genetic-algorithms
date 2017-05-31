function finish = max_fitness_stucked(population, generation)
  % Check if there has been a long time since there hadn't been important
  % max fitness improvements
  persistent last_i_generations_max_fitness;
  config = get_config('max_fitness_stucked');
  i_generations_gap = config.i_generations_gap;
  expected_delta_threshold = config.expected_delta_threshold;
  % Default: don't finish
  finish = false;
  last_index = get_circular_index(generation, i_generations_gap);
  last_i_generations_max_fitness(last_index) = max([population(:).fitness]);
  % If we have not cycled at least once over all possible values of the 
  % gap, we should not evaluate this condition yet
  if i_generations_gap > generation
    return;
  end
  % Else, we should check whether there have been siginificant improvements
  % over the last i generations
  first_index = get_circular_index(generation + 1, i_generations_gap);
  delta_in_i_generations = last_i_generations_max_fitness(last_index) ...
      - last_i_generations_max_fitness(first_index);
  % If fitness hadn't been improved what was expected over the last i
  % generations, finish the algorithm (i.e.: we consider it has
  % prematurely converged)
  if delta_in_i_generations < expected_delta_threshold
    finish = true;
  end
end
