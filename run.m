% Flight control simulator script
% Created by J.S
% Matlab R2019a

% Prepare global var for mouse click control
global mouse_clicked;
mouse_clicked = 0;

% Core values
% N - amount of cities on map, 
%   it is recommendeded to keep this proportional to mapsize
%   (suggested values 5 < N < 50)
% MapSize - size of the map (suggested values 250 < MapSize < 1000)
% MaxFlights - the max amount of flights happening at once.
N = 20;
MapSize = 500;
MaxFlights = 10;

% Set up figure
fh = figure( ...
    'Name',         'Flight Control', ...
    'NumberTitle',  'off', ...
    'Color',        '#808080', ... 
    'MenuBar',      'none', ...
    'ToolBar',      'none', ...
    'units',        'normalized', ...
    'outerposition', [0 0 1 1], ...
    'WindowButtonDownFcn', @click_callBack ...
    );

% Add message box
annotation(...
    'textbox', [0.8, 0.5, 0.1, 0.1], ...
    'BackgroundColor', '#e5e5e5', ...
    'FontSize', 14, ...
    'EdgeColor', 'w', ...
    'LineWidth', 2, ...
    'String',  fileread('message.txt')...
    );

% Courses counter
curr = MaxFlights;
current = annotation(...
    'textbox', [0.8, 0.3, 0.1, 0.1], ...
    'BackgroundColor', '#e5e5e5', ...
    'FontSize', 14, ...
    'EdgeColor', 'w', ...
    'LineWidth', 2, ...
    'String',  strcat('Courses Started:   ', num2str(curr))...
    );

% Prepare map
[ax, CityX, CityY] = map(fh, MapSize, N);

% Preallocate flights array
Flights = cell(1, MaxFlights);
for i = 1:MaxFlights
    [t.aph, t.dest, t.dir] = course(CityX, CityY);
    Flights{:,i} = t;
end

% Begin simulation
iter = 0;
while ishandle(fh) && ishandle(ax)
    % Fill empty airplane slots with spawn chance
    if ishandle(Flights{mod(iter,MaxFlights) + 1}.aph) == 0 && rand() > .5
        [t.aph, t.dest, t.dir] = course(CityX, CityY);
        Flights{mod(iter,MaxFlights) + 1} = t; 
        set(current, 'String',  strcat('Courses Started:   ', num2str(curr)));
    end
    
    iter = iter + 1;
    
    % Update in random order for flight effect
    order = randperm(MaxFlights,MaxFlights);
    for i = 1:MaxFlights
        if ishandle(Flights{order(i)}.aph)
        curr =  curr + fly( ...
            Flights{order(i)}.aph, ...
            Flights{order(i)}.dest, ...
            Flights{order(i)}.dir ...
            );
        end
    end

    % Enable fast flying
    if mouse_clicked == 1 && ishandle(fh)
       pause(0.03); 
    else
        pause(rand());
    end

end


function click_callBack(~, ~)
% Helper function for controlling mouse clicks in figure
    global mouse_clicked;
    if mouse_clicked == 0
        mouse_clicked = 1;
    else
        mouse_clicked = 0;
    end
end