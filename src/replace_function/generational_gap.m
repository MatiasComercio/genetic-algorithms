function new_population = generational_gap(N, k_children, ~, G, ...
    T, replace_selection_function, population, children)
  original_population_size = round(N * (1-G));
  children_population_size = round(N * G);
  
  if (children_population_size > k_children)
     error('round(N*G) should be <= K, but %f was > %f', ...
      children_population_size, k_children); 
  end
  
  original_population = replace_selection_function(population, ...
      original_population_size, T);
  children_population = replace_selection_function(children, ...
      children_population_size, T);

  new_population = [original_population, children_population];
end

