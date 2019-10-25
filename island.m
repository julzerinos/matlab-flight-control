function island = island(ax, xi, yi, type)
    
    if nargin < 4
       type = 'c'; 
    end

    rng('shuffle','twister');

    if type == 'p'
%   Polygon
        N = 50;
        a = sort(rand(N,1)) * 0.5 * pi;
        r = sort(randi([-5 5], N, 1));

        x = (a) .* (r + xi) ;
        y = sin(a) .* (r + yi) ;
        
    elseif type == 't'
%   Trigonometry Based
        scale = randi([150 250]);

        th = 0:pi/50:randperm(5,1)*pi;

        r1 = sort(randi(scale * [-1 1], size(th,2), 1));
        r2 = sort(randi(scale * [-1 1], size(th,2), 1));

        x = r1 .* cos(randperm(5,1) * th) + xi;
        y = r2 .* sin(randperm(5,1) * th) + yi;
        
    else
%   Circle
        th = 0:pi/50:2*pi;
        x = (50 + randperm(50,1)) * cos(th) + xi;
        y = (50 + randperm(50,1)) * sin(th) + yi; 
        
    end

    island = patch(ax, x, y, 'g', 'EdgeColor', 'g');

end