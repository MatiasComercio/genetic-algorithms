function print_character(character)
    format long;
    items_set = character.items_set;
    
    fprintf('Height: %f, Boots: %i, Chest: %i, Gloves: %i, Helmet: %i, Weapon: %i\n', character.height, ...
    items_set.boots.id, items_set.chest.id, items_set.gloves.id, items_set.helmet.id, items_set.weapon.id);
    
    %fprintf('Height: ', character.height, ' Boots: ', items_set.boots.id, ' Chest: ', items_set.chest.id, ...
    %' Gloves: ', items_set.gloves.id, ' Helmet: ', items_set.helmet.id, ' Weapon: ', items_set.weapon.id);
end