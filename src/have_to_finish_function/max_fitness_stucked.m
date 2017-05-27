function finish = max_fitness_stucked(population, generation)
  config = get_config('max_fitness_stucked');
  % Default: don't finish
  finish = false;
  % Check if there has been a long time since there hadn't been important
  % fitness improvements (regarding max_fitness)
  persistent last_i_generations;
  i_generations_gap = config.i_generations_gap;
  expected_delta_threshold = config.expected_delta_threshold;
  index = mod(generation, i_generations_gap) + 1;
  last_i_generations(index) = max([population(:).fitness]);
  % If we have not cycled at least once over all possible values of the 
  % gap, we should not evaluate this condition yet
  if i_generations_gap > generation
    return;
  end
  % Else, we should check whether there have been siginificant improvements
  % over the last i generations
  % Create new array sorted by generation to be able to calculate diff
  % (i.e., improvements) with the diff function
  %
  % Take from the oldest saved generation (i.e., the next one to be
  % overwritten) to the end and start over again, until the current index
  % (i.e., the last saved value) has been reached
  if index == i_generations_gap
    % Already sorted
    sorted_by_generation = last_i_generations;
  else
    sorted_by_generation = [ last_i_generations(index+1:end), ...
        last_i_generations(1, index) ];
  end
  delta_in_i_generations = sum(diff(sorted_by_generation));
  % If fitness hadn't been improved what was expected over the last i
  % generations, finish the algorithm (i.e.: we consider it has
  % prematurely converged)
  if delta_in_i_generations < expected_delta_threshold
    finish = true;
  end
end

