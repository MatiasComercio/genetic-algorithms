function [child1_attributes, child2_attributes] = annular_crossover(parent1_attributes, parent2_attributes)
    len = length(parent1_attributes);
    child1_attributes(len) = parent1_attributes(len);
    child2_attributes(len) = parent1_attributes(len);
    point = randi(len);
    l = randi(len/2);
    
    for i=0:len-1 % Go over all the parent attributes
        index = mod(point + i, len); % Starting from the given point
        if index == 0
            index = len;
        end
        if i < l + 1 % (l+1) attributes will be taken from opposite parent, going in a circular way
            child1_attributes(index) = parent2_attributes(index);
            child2_attributes(index) = parent1_attributes(index);
        else % The rest will be inherited from original parent
            child1_attributes(index) = parent1_attributes(index);
            child2_attributes(index) = parent2_attributes(index);
        end
    end    
end
