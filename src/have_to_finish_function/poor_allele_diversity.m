function finish = poor_allele_diversity(population, ~)
  config = get_config('poor_allele_diversity');
  items_sets = [population(:).items_set];
  unique_heights = length(unique([population(:).height]));
  unique_boots = length(unique(get_ids([items_sets(:).boots])));
  unique_helmets = length(unique(get_ids([items_sets(:).helmet])));
  unique_gloves = length(unique(get_ids([items_sets(:).gloves])));
  unique_chests = length(unique(get_ids([items_sets(:).chest])));
  unique_weapons = length(unique(get_ids([items_sets(:).weapon])));
  max_diversity = max([unique_heights, unique_boots, unique_helmets, ...
      unique_gloves, unique_chests, unique_weapons]);
  finish = max_diversity < config.max_diversity;
end

function ids = get_ids(arr)
  ids = [arr(:).id];
end
