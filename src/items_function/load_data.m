function data = load_data()
  config = get_config('items_files');
  d_folder = config.items_files_folder;
  d_range = [config.first_row config.first_col ...
      config.last_row config.last_col];
  data.boots = dlmread(strcat(d_folder, config.boots_file),'\t', d_range);
  data.helmets = dlmread(strcat(d_folder, config.helmets_file),'\t', d_range);
  data.chests = dlmread(strcat(d_folder, config.chests_file),'\t', d_range);
  data.gloves = dlmread(strcat(d_folder, config.gloves_file),'\t', d_range);
  data.weapons = dlmread(strcat(d_folder, config.weapons_file),'\t', d_range);
end

