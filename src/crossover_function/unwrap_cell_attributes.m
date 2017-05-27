function [ height, items_set] = unwrap_cell_attributes(attributes)
    height = cell2mat(attributes(1)); 
    boots_cell = cell2struct(attributes(2), 'boots');
    chest_cell = cell2struct(attributes(3), 'chest');
    gloves_cell = cell2struct(attributes(4), 'gloves');
    helmet_cell = cell2struct(attributes(5), 'helmet');
    weapon_cell = cell2struct(attributes(6), 'weapon');
    
    items_set.boots = boots_cell.boots;
    items_set.chest = chest_cell.chest;
    items_set.gloves = gloves_cell.gloves;
    items_set.helmet = helmet_cell.helmet;
    items_set.weapon = weapon_cell.weapon;
end