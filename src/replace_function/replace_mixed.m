function new_population = replace_mixed(N, ~, k_replace, ~, ...
    T, replace_selection_function, population, children)
  n = N;
  k = k_replace;
  if (k_replace > N || k_replace < 0)
    error('It should be 0 <= k_replace <= N, but k_replace was %f and N was %f', ...
      k_replace, N); 
  end
  
  n_k_population = replace_selection_function(population, n-k, T);
  full_population = [population, children];
  k_population = replace_selection_function(full_population, k, T);
  new_population = [ n_k_population, k_population ];
end

