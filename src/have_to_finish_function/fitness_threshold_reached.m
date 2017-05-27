function finish = fitness_threshold_reached(population, ~)
  config = get_config('fitness_threshold_reached');
  fitness_threshold = config.fitness_threshold;
  max_fitness = max([population(:).fitness]);
  finish = false;
  % Check if threshold has been reached
  if max_fitness >= fitness_threshold
    finish = true;
  end
end

