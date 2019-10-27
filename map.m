function [ax, x, y] = map(fh, MapSize, N)
% Creates a square map of side length 2 x MapSize
% arguments
% fh      [figure obj] figure container
% MapSize [int]        size for map
% N       [int]        amount of cities to populate map with
% returns
% ax   [axes obj]           axes used for map
% x, y [N size array float] arrays of city coordiantes

    if nargin < 2
        N = 5;
    end
    if nargin < 1
        fh = figure();
    end
    
    % Create axis used for map
    ax = axes(fh, 'NextPlot','add');
    axis(ax, MapSize * [-1 1 -1 1]);
    set(ax, 'Color', '#96C3CE');
    set(ax, 'DataAspectRatio', [1 1 1]);
    
    % Select city points
    x = 2 * MapSize * rand(1,N) - MapSize;
    y = 2 * MapSize * rand(1,N) - MapSize;
    
    % Populate with islands (must be done loopwise,
    % as a new island should be created for each set of coordinates
    for i = 1:N
        island(ax, x(i), y(i), 'c');
    end
    
    % Plot cities and set to square resolution
    plot(x, y, '^', 'MarkerSize', 5,'MarkerFaceColor', [0 0 0]);

    % Populate cities with names
    text( ...
        x + 20, y, city(N), ...
        'HorizontalAlignment', 'left', ...
        'BackgroundColor', 'w' ...
        );
    
end