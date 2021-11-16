function combined_coef_mat = adaptive_weighted_ave_coef_exp_abs_diff_comb_fn(sband1, sband2, exp_a, window_m, window_n)
    % the function
    % to implement eq. 32 of the paper:
    % A wavelet-based image fusion tutorial
    % input: sub-band of image 1, sub-band of image 2, exponent parameter a, window_m, and window_n
    % window_m, and window_n --> len and width window size for computing window based mean value for sub-band matrix, centered at position (i, j)

    %%% computation: weight of each input sub-band: exponentional abs diff between sub-band and window-based mean matrix

    % set the default threshold alpha value:
    % if(nargin<3)
    %     exp_a = 0.5;
    % end

    % windowed mean:
    w_mean_sband1 = windowed_centered_mean(sband1, window_m, window_n);
    w_mean_sband2 = windowed_centered_mean(sband2, window_m, window_n);

    weight_sband1 = (abs( sband1-w_mean_sband1 )).^exp_a;
    weight_sband2 = (abs( sband2-w_mean_sband2 )).^exp_a;

    combined_coef_mat = (weight_sband1.*sband1 + weight_sband2.*sband2)./(weight_sband1+weight_sband2);






