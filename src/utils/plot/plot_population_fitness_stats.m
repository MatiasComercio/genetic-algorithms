function plot_figure = plot_population_fitness_stats( generation, population )
    persistent plot_population_fitness_stats_figure;
    
    if isempty(plot_population_fitness_stats_figure) || ...
            ~ishandle(plot_population_fitness_stats_figure) 
        plot_population_fitness_stats_figure = figure;
    end
    
    plot_figure = plot_population_fitness_stats_figure;
    figure(plot_population_fitness_stats_figure);
    
    subplot(1, 2, 1);
    plot(generation, max([population(:).fitness]), 'b*');
    hold on;
    
    subplot(1, 2, 2);
    plot(generation, mean([population(:).fitness]), 'b*');
    hold on;
    drawnow;
end
