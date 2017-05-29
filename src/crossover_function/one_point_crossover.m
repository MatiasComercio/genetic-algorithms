function [child1_attributes, child2_attributes] = one_point_crossover(parent1_attributes, parent2_attributes)
    len = length(parent1_attributes);
    child1_attributes(len) = parent1_attributes(len);
    child2_attributes(len) = parent1_attributes(len);    
    point = randi(len);
    
    for i=1:point-1
        child1_attributes(i) = parent1_attributes(i);
        child2_attributes(i) = parent2_attributes(i);
    end
    
    for i=point:len
        child1_attributes(i) = parent2_attributes(i);
        child2_attributes(i) = parent1_attributes(i);
    end    
end
