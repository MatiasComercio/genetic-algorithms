function plot_figure = plot_population_fitness_stats(population , ...
    generation)
    persistent plot_population_fitness_stats_figure;
    
    if isempty(plot_population_fitness_stats_figure) || ...
            ~ishandle(plot_population_fitness_stats_figure) 
        plot_population_fitness_stats_figure = figure;
    end
    
    plot_figure = plot_population_fitness_stats_figure;
    figure(plot_figure);
    [max_fitness, index] = max([population(:).fitness]);

    subplot(10, 2, 1:2:18);
    plot(generation, max_fitness, 'b*');
    title('Max fitness per generation');
    xlabel('Generation');
    ylabel('Max Fitness');
    hold on;

    subplot(10, 2, 2:2:18);
    mean_fitness = mean([population(:).fitness]);
    plot(generation, mean_fitness, 'b*');
    title('Mean fitness per generation');
    xlabel('Generation');
    ylabel('Mean Fitness');
    hold on;

    splot = subplot(10, 2, [19, 20]);
    set(splot, 'visible', 'off');
    % Get character with max fitness
    character = population(index);
    txt = {sprintf('Character: %s', character.to_string(character)), ...
        sprintf('Max fitness (current character): %f; Mean fitness: %f', ...
          max_fitness, mean_fitness), ...
        sprintf('Generation: %i', generation)};
    persistent plot_text;
    if ~isempty(plot_text)
       delete(plot_text);
    end
    plot_text = text(0, -0.5, txt);
    drawnow;
end
