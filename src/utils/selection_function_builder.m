function fnc = selection_function_builder(fnc1, fnc2, alpha)
  fnc = @(population, size, T) selection_function(fnc1, fnc2, alpha, ...
      population, size, T);
end

function sample = selection_function(fnc1, fnc2, alpha, ...
    population, size, T)
  sample_1 = fnc1(population, round(size * alpha), T);
  sample_2 = fnc2(population, round(size * (1-alpha)), T);
  sample = [sample_1, sample_2];
end

