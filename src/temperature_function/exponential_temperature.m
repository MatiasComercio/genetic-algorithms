function T  = exponential_temperature( generation, ~ )
% Lower T available will be 1 for simplicity sake
% If it goes lower than this bound, exp(f(i)/T) may cause Inf values,
% which will lead to errors during execution.
% As the max possible fitness is lower than 300 for every possible player,
% and temperature will always be > 1, we can assume the lower case for
% calculation, when T = 1 => exp(300) = 1.9424e+130, which means Matlab can
% calculate this value (even multiply it by 10000; at least up to that is
% what we've tested)
% All of this makes this temperature calculation ideal for this particular
% problem
    config = get_config('exponential_temperature');
    x_multiply_constant = config.x_multiply_constant;
    x_add_constant = config.x_add_constant;
    exp_add_constant = config.exp_add_constant;
    T = exp(-generation .* x_multiply_constant + x_add_constant) + ...
        exp_add_constant;
end
