function [ index ] = get_circular_index( i, size )
  index = mod(i, size) + 1;
end

