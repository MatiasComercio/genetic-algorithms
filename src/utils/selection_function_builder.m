function fnc = selection_function_builder(fnc1, fnc2, alpha)
  fnc = @(population, size, T) selection_function(fnc1, fnc2, alpha, ...
      population, size, T);
end

function sample = selection_function(fnc1, fnc2, alpha, ...
    population, size, T)
  size_1 = round(size * alpha);
  size_2 = size - size_1;
  sample_1 = fnc1(population, size_1, T);
  sample_2 = fnc2(population, size_2, T);
  sample = [sample_1, sample_2];
end

