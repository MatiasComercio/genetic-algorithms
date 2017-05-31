function item = load_item(item_values)
  indexes = get_config('class_file_indexes');
  item.id = item_values(indexes.id);
  item.strength = item_values(indexes.strength);
  item.agility = item_values(indexes.agility);
  item.expertise = item_values(indexes.expertise);
  item.resistance = item_values(indexes.resistance);
  item.vitality = item_values(indexes.vitality);
end

