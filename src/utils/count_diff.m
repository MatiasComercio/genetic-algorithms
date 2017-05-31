function [ diff_counter ] = count_diff( A, B )
  diff_counter = 0;
  
  for i=1:length(A)
    [is_member, member_index] = ismember(A(i), B);
    if (is_member)
      B(member_index) = NaN;
    else
      diff_counter = diff_counter + 1;
    end
  end
end
