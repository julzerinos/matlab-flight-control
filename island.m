function island = island(ax, xi, yi, type)
% Function plots random sized islands at given coordinates
% arguments
% ax        [axes obj]          axes to plot in
% xi, yi    [array of floats]   cooridates
% type      [char]              type of island shape
% returns
% island    [patch obj]         patch object of island

    if nargin < 4
       type = 'c'; 
    end

    rng('shuffle','twister');

    if type == 'p'
    % Polygon based shape (wonky)
        N = 50;
        a = sort(rand(N,1)) * 0.5 * pi;
        r = sort(randi([-5 5], N, 1));

        x = (a) .* (r + xi) ;
        y = sin(a) .* (r + yi) ;
        
    elseif type == 't'
    % Trigonometry Based (very heavy use with caution)
        scale = randi([150 250]);

        th = 0:pi/50:randperm(5,1)*pi;

        r1 = sort(randi(scale * [-1 1], size(th,2), 1));
        r2 = sort(randi(scale * [-1 1], size(th,2), 1));

        x = r1 .* cos(randperm(5,1) * th) + xi;
        y = r2 .* sin(randperm(5,1) * th) + yi;
        
    elseif type == 'c'
    % Circle (default)
        th = 0:pi/50:2*pi;
        x = (50 + randperm(50,1)) * cos(th) + xi;
        y = (50 + randperm(50,1)) * sin(th) + yi; 
        
    end

    island_color = '#95BF74';
    island = patch(ax, x, y, 'g','FaceColor', island_color, 'EdgeColor', island_color);

end