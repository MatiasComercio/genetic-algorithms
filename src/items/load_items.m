function items_map = load_items()
    classes_names = {'boots', 'chests', 'gloves', 'helmets', 'weapons'};
    len = length(classes_names);
    classes_stats{len} = load_class_stats(datasample(classes_names, 1));

    for i = 1:len
        classes_stats{i} = load_class_stats(classes_names(i));
    end
    
    items_map = containers.Map(classes_names, classes_stats);
end

function class_stats = load_class_stats(class_name)
    class_filename = strcat(class_name, ".tsv");
    class_stats_original = tdfread(class_filename);
    len = length(class_stats_original.id);
    class_stats(len).strength = 0;

    for i = 1:len
        class_stats(i).id = class_stats_original.id(i);
        class_stats(i).strength = class_stats_original.Fu(i);
        class_stats(i).agility = class_stats_original.Ag(i);
        class_stats(i).expertise = class_stats_original.Ex(i);
        class_stats(i).resistance = class_stats_original.Re(i);
        class_stats(i).vitality = class_stats_original.Vi(i);
    end
end
