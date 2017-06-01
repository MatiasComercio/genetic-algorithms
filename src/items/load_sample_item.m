function item = load_sample_item(all_data, item_name)
  all_items = all_data.(item_name);
  item_id = randi(length(all_items));
  item_values = all_items(item_id,:);
  item = load_item(item_values);
end
