function item = load_file_sample_item(class_name)
  % Load class_name file indexes
  indexes = get_config('class_file_indexes');
  % Generate a random row index among all possible values
  row = randi([indexes.first_row, indexes.last_row]);
  % Read only that specific item values
  class_filename = strcat(class_name, '.tsv');
  item_values = dlmread(class_filename,'\t', ...
      [row indexes.first_col row indexes.last_col]);
  item = load_item(item_values);
end

