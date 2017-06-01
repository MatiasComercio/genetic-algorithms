function data = load_data()
  config = get_config('class_file_indexes');
  d_folder = 'src/items/';
  d_range = [config.first_row config.first_col ...
      config.last_row config.last_col];
  data.boots = dlmread(strcat(d_folder, 'boots.tsv'),'\t', d_range);
  data.helmets = dlmread(strcat(d_folder, 'helmets.tsv'),'\t', d_range);
  data.chests = dlmread(strcat(d_folder, 'chests.tsv'),'\t', d_range);
  data.gloves = dlmread(strcat(d_folder, 'gloves.tsv'),'\t', d_range);
  data.weapons = dlmread(strcat(d_folder, 'weapons.tsv'),'\t', d_range);
end

