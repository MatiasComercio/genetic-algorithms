% Find if any children (except for the immediately following each)
counter = 0;
mapper = containers.Map;
mapper_2 = containers.Map;
children_ids = [];
c = 1;
for i=1:2:length(children)-2
  parents = children(i).parents_ids;
  if parents == [-2, -1]
    children_ids(c) = children(i).id;
    c = c+1;
    children_ids(c) = children(i+1).id;
    c = c+1;
  end

  if mapper.isKey(char(parents)) || mapper.isKey(char(fliplr(parents)))
    continue
  end
  mapper(char(parents)) = false;
  for j=i+2:2:length(children)
    j_parents = children(j).parents_ids;
    if parents == j_parents
       mapper_2(char(parents)) = true;
       counter = counter + 1; 
    end
  end
end
