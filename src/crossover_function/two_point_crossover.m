function [child1_attributes, child2_attributes] = two_point_crossover(parent1_attributes, parent2_attributes)
    len = length(parent1_attributes);
    child1_attributes(len) = parent1_attributes(len);
    child2_attributes(len) = parent1_attributes(len);
    point1 = randi([2, len-1]); % from 2 to len-1
    point2 = randi([point1+1, len]); % point2 > point1
    
    for i=1:point1-1
        child1_attributes(i) = parent1_attributes(i);
        child2_attributes(i) = parent2_attributes(i);
    end
    
    for i=point1:point2-1
        child1_attributes(i) = parent2_attributes(i);
        child2_attributes(i) = parent1_attributes(i);
    end
    
    for i=point2:len
        child1_attributes(i) = parent1_attributes(i);
        child2_attributes(i) = parent2_attributes(i);
    end
end
