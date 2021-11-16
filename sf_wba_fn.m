function activity_level = sf_wba_fn( sband_mat )
    % Activity level computation method
    %! the function to compute spatial frequency window-based activity (SF-WBA) level of input sub-band at specific decomposition level and specific frequency band, 
    %! for an MxN image window block
    %! NOTICE: compute the spatial frequency of the whole input sband matrix
    % to implement eq.23 of the paper:
    % A wavelet-based image fusion tutorial
    [M, N] = size(sband_mat);

    %* computation of row frequency, R:
    count = 1;
    for i=1:M
        for j=2:N
            row_freq(count) = (sband_mat(i, j) - sband_mat(i, j-1))^2;
            count = count+1;
        end
    end
    
    row_freq = sqrt( sum(row_freq(:))/(M*N) );


    %* computation of column frequency, R:
    count = 1;
    for j=1:N
        for i=2:M
            col_freq(count) = (sband_mat(i, j) - sband_mat(i-1, j))^2;
            count = count+1;
        end
    end
    
    col_freq = sqrt( sum(col_freq(:))/(M*N) );

    activity_level = sqrt( row_freq^2 + col_freq^2 );
