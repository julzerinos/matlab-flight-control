function [aph, dest, direction] = course(CityX, CityY)
% Create an airplane course between two cities
% arguments
% CityX, CityY [array of flaots] array of city coordinates

    N = numel(CityX);
    
    % Choose two cities
    points = randperm(N, 2);
    spwn = [CityX(points(1)) CityY(points(1))];
    dest = [CityX(points(2)) CityY(points(2))];
    direction = (dest - spwn) / norm(dest - spwn);
    angle = pi + atan2(direction(2), direction(1));
    
    % Plot connection and airplane
    rcol = rand(1, 3);
    arrow(spwn, dest, rcol);
    aph = airplane(spwn(1), spwn(2), angle, rcol);
        
end

