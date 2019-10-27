function p = airplane(x, y, angle, col)
% Helper function to create and plot an airplane patch
% arguments
% x, y  [float]     spawn coordinates
% angle [rad]       angle of rotation of figure
% col   [1x3 float] color array    
% returns
% p     [patch obj] plotted patch object

    % Airplane body with transposition to center
    % for center use mean(x) and mean(y)
    S3 = [ -1   0 ;
           -1   1 ;
            0   2 ;
            4   2 ;
            8  10 ;
            8   2 ;
           12   2 ;
           14   4 ;
           14  -4 ;
           12  -2 ;
            8  -2 ;
            8 -10 ;
            4  -2 ;
            0  -2 ;
           -1  -1 ;
           -1   0 ;
           ].' + [-7 ; 0];

    % Random scale
    S3 = (rand() + .5) * S3;
    
    % Rotation
    S3 = [ cos(angle) -sin(angle); sin(angle)  cos(angle) ] * S3;
    
    % Transpostion
    S3 = [x ; y] + S3;
    
    symbols = ['A':'Z' '0':'9'];
    p = patch( ...
        S3(1,:), ...
        S3(2,:), ...
        'b', ...
        'EdgeColor', [0 0 0], ...
        'LineWidth', 1, ...
        'FaceColor', col, ...
        'Tag', symbols(randi(numel(symbols), [1 6])) ...
        );
    
end