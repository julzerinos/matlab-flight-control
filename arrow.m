function arrow(s, d, col)
% Function plots a dashed arrow with arrowhead in the middle 
% from spwn to dest
% arguments
% spwn, dest [2x1 float] coordinates
% col        [1x3 float] color array

    plot([s(1) d(1)], [s(2) d(2)], '--', 'Color', col, 'LineWidth', 1);
    
    qv = quiver(s(1), s(2), .5*(d(1) - s(1)), .5*(d(2) - s(2)), 0);
    qv.LineWidth = 1;
    qv.Color = col;
    qv.Tail.LineStyle = 'none';
    qv.Head.LineStyle = 'solid';

end