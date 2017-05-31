function new_population = replace_all_parents(N, k_children, ...
    ~, ~, ~, ~, ~, children)
  if (k_children ~= N)
     error('K should be equal to N, but %d was ~= %d', ...
      k_children, N); 
  end
  new_population = children;
end

