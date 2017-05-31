function new_population = replace_with_all_children(N, k_children, ...
    ~, ~, T, replace_selection_function, population, children)
  n = N;
  k = k_children; 
  n_k_population = replace_selection_function(population, n-k, T);
  new_population = [ children, n_k_population ];
end

