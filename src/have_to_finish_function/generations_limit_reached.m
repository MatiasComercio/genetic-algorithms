function finish = generations_limit_reached(~, generation)
  config = get_config('max_generations');
  max_generation = config.max_generations;
  finish = generation >= max_generation;
end

