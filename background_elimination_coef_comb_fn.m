function combined_coef_mat = background_elimination_coef_comb_fn(sband1, sband2, window_m, window_n)
    % the function to perform Background Elimination (BE) combining scheme
    % to implement eq.37 at page 1864 of the paper:
    % A wavelet-based image fusion tutorial
    % input: sub-band of image 1, sub-band of image 2, window_m, and window_n
    % window_m, and window_n --> len and width window size for computing window based mean value for sub-band matrix, centered at position (i, j)


    % set the default threshold alpha value:
    % if(nargin<3)
    %     exp_a = 0.5;
    % end

    % windowed mean:
    w_mean_sband1 = windowed_centered_mean(sband1, window_m, window_n);
    w_mean_sband2 = windowed_centered_mean(sband2, window_m, window_n);


    combined_coef_mat = sband1+sband2-w_mean_sband1-w_mean_sband2+(w_mean_sband1+w_mean_sband2)./2;






