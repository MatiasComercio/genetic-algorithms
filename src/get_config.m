function out = get_config( input_string )
    out = [];

    switch lower(input_string)
        case 'main'
            out.N = 10;
     otherwise
            error('%s config not found', upper(input_string));
    end
end