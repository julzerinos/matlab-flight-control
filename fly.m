function state = fly(aph, dest, direction)
% Updates airplane position and label
% arguments
% aph [patch obj] airplane to update
% dest [2x1 float] coordinates
% direction [2x1] direction of movement
% return
% state [bool] if plane reached its destination

    global mouse_clicked;
    
    % Delete the current label to redraw
    delete(findobj('Tag', num2str(aph.FaceColor)));

    x = aph.XData;
    y = aph.YData;

    % Check if plane has arrived
    if norm(dest - [mean(x) mean(y)]) < 1
        delete(aph);
        state = 1;
        return
    end

    if mouse_clicked == 1
        boost = 1;
    else
        boost = randi([0 3]);
    end
    
    aph.XData = x + boost * direction(1);
    aph.YData = y + boost * direction(2);

    text( ...
        x(1) + 20, y(1) , ...
        aph.Tag, ...
        'HorizontalAlignment', 'left', ...
        'BackgroundColor', '#000000', ...
        'Color', 'g', ...
        'EdgeColor', '#808080', ...
        'Tag', num2str(aph.FaceColor) ...
    );

    state = 0;
end