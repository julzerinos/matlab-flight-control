function p = airplane(x, y, angle)

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
           ].';

    angle = angle;
    S3 = [ x ; y ] + [ cos(angle) -sin(angle); sin(angle)  cos(angle) ] * S3;

    rcol = rand(1, 3);
    p = patch( ...
        S3(1,:), ...
        S3(2,:), ...
        'b', ...
        'EdgeColor', [0 0 0], ...
        'LineWidth', 1, ...
        'FaceColor', rcol ...
        );

end