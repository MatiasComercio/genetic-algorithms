function plot_population_fitness_stats(population , ...
    generation)
    persistent plot_population_fitness_stats_figure;
    
    if isempty(plot_population_fitness_stats_figure) || ...
            ~ishandle(plot_population_fitness_stats_figure) 
        plot_population_fitness_stats_figure = figure;
        % Only maximize window when plot starts
        set(gcf, 'Position', get(0, 'Screensize'));
        % Set handler for user input to finish algorithm loop
        % Code taken and adapted from:
        % https://www.mathworks.com/matlabcentral/answers/100980-how-do-i-write-a-loop-in-matlab-that-continues-until-the-user-presses-any-key
        set(gcf, 'KeyPressFcn', @user_stop_fnc);
    end
    
    plot_figure = plot_population_fitness_stats_figure;
    % If current figure is not the desired one, set it in top of the others
    if gcf ~= plot_figure
        figure(plot_figure);
    end

    subplot(5, 1, 1:4);
    title('Fitness per generation');
    xlabel('Generation');
    ylabel('Fitness');
    
    population_fitness = [population(:).fitness];
    % Plot max, mean and min fitness
    [max_fitness, max_index] = max(population_fitness);
    mean_fitness = mean(population_fitness);
    min_fitness = min(population_fitness);
    plot(generation, max_fitness, 'k*', ...
        generation, mean_fitness, 'bo', ...
        generation, min_fitness, 'rx');

    % Add legend for the above plot
    legend('Max Fitness', 'Mean Fitness', 'Min Fitness', ...
        'Location', 'southeast');

    % Keep graphic
    hold on;
    
    % Plot information
    splot = subplot(5, 1, 5);
    set(splot, 'visible', 'off');
    max_fitness_counter = sum(population_fitness == max_fitness);
    below_mean_fitness_counter = sum(population_fitness < mean_fitness);
    items_sets = [population(:).items_set];
    unique_ids = length(unique([population(:).id]));
    unique_heights = length(unique([population(:).height]));
    unique_boots = length(unique(get_ids([items_sets(:).boots])));
    unique_helmets = length(unique(get_ids([items_sets(:).helmet])));
    unique_gloves = length(unique(get_ids([items_sets(:).gloves])));
    unique_chests = length(unique(get_ids([items_sets(:).chest])));
    unique_weapons = length(unique(get_ids([items_sets(:).weapon])));
    
    persistent max_fitness_generation;
    persistent max_fitness_saved;
    persistent max_fitness_delta;
    if isempty(max_fitness_generation) || isempty(max_fitness_saved) ...
            || isempty(max_fitness_delta) || generation == 0
       max_fitness_generation = generation;
       max_fitness_delta = 0;
       max_fitness_saved = max_fitness;
    end

    if max_fitness > max_fitness_saved
       max_fitness_generation = generation;
       max_fitness_delta = max_fitness - max_fitness_saved;
       max_fitness_saved = max_fitness;
    end

    % Get character with max fitness
    character = population(max_index);
    % Stats to be showed in each generation
    txt = {sprintf('Character: %s', character.to_string(character)), ...
        sprintf('Max fitness (current character): %f; Mean fitness: %f; Min fitness: %f', ...
          max_fitness, mean_fitness, min_fitness), ...
        sprintf('Generation: %i; Max fitness generation: %i; Delta max fitness: %f', ...
          generation, max_fitness_generation, max_fitness_delta), ...
        sprintf('Individuals with max fitness: %i; Individuals with fitness below mean fitness: %i', ...
          max_fitness_counter, below_mean_fitness_counter),...
        sprintf('Unique: Ids = %i, Heights = %i, Boots = %i, Helmets = %i, Gloves = %i, Chests = %i, Weapons = %i', ...
          unique_ids, unique_heights, unique_boots, unique_helmets, ...
          unique_gloves, unique_chests, unique_weapons)};
    % Refresh plot text each generation
    persistent plot_text;
    if ~isempty(plot_text)
       delete(plot_text);
    end
    plot_text = text(0, 0, txt);
    drawnow;
end

function ids = get_ids(arr)
  ids = [arr(:).id];
end

function user_stop_fnc(~, event)
    % Finish loop on 'q' key input
    if (event.Key ~= 'q')
      return;
    end
    global USER_STOP;
    USER_STOP  = true;
    disp('[STOP] - User input');
end
