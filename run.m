fh = figure( ...
    'Name',         'Flight Control', ...
    'NumberTitle',  'off', ...
    'Color',        '#808080', ... 
    'MenuBar',      'none', ...
    'ToolBar',      'none', ...
    'units',        'normalized', ...
    'outerposition',[0 0 1 1] ...
    );

[ax, x, y] = map(fh, N);

while ishandle(fh)

    points = randperm(N, 2);

    direction = [ x(points(2)) y(points(2)) ] - [ x(points(1)) y(points(1)) ];
    direction = direction / norm(direction);
    
    angle = pi + atan2(y(points(2)) - y(points(1)), x(points(2)) - x(points(1)));
    
    sp = [x(points(1)) y(points(1))];
    dest = [x(points(2)) y(points(2))]
    aph = airplane(xi, yi, angle);

    while ishandle(fh) && ishandle(aph)

        x = aph.XData;
        y = aph.YData;
        
        if norm(dest - [x y]) < 1
            delete(aph)
            break
        end
        
        aph.XData = x + direction(1);
        aph.YData = y + direction(2);
        
        pause(0.01)
        
    end
    


    pause();
end