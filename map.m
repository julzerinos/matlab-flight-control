function [ax, x, y] = map(fh, N)

    if nargin < 2
        N = 5;
    end
    if nargin < 1
        fh = figure();
    end

    MapSize = 500;
    
    ax = axes(fh, 'NextPlot','add');
    axis(ax, MapSize * [-1 1 -1 1]);

    x = 2 * MapSize * rand(1,N) - MapSize;
    y = 2 * MapSize * rand(1,N) - MapSize;
    
    for i = 1:N
       
        island(ax, x(i), y(i));
        
    end
    
    plot(x,y,'^','MarkerSize',5,'MarkerFaceColor', [0 0 0]);
    set(gca, 'Color', 'b');
    
    labels = city(N);
    text(x + 20, y, labels, 'HorizontalAlignment', 'left', 'BackgroundColor', 'w');
    
end