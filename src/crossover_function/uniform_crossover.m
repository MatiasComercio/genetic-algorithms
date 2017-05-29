function [child1_attributes, child2_attributes] = uniform_crossover(parent1_attributes, parent2_attributes)
    config = get_config('uniform_crossover');
    p = config.p;
    len = length(parent1_attributes);
    child1_attributes(len) = parent1_attributes(len);
    child2_attributes(len) = parent1_attributes(len);
    
    for i=1:len
        if rand() < p 
            child1_attributes(i) = parent2_attributes(i); % Swap parents attributes
            child2_attributes(i) = parent1_attributes(i);
        else
            child1_attributes(i) = parent1_attributes(i); % Inherit same parent attributes
            child2_attributes(i) = parent2_attributes(i);
        end
    end    
end
