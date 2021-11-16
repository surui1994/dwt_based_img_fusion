function combined_coef_mat = weighted_ave_coef_comb_fn(weight, sband1, sband2, thresh_alpha)
    %! the general weighted average coefficients combination method for same subbands (specific level and frequency) from different images to be fused
    % the function
    % to implement eq. 27 of the paper:
    % A wavelet-based image fusion tutorial
    % input: weight matrix (3x3 or 5x5), sub-band of image 1, sub-band of image 2
    % * output: fused subbands at specific level and frequency 

    % set the default threshold alpha value:
    if(nargin<4)
        thresh_alpha = 0.5;
    end

    % Activity level of sband1 and sband2:
    % using weighted average method:
    a_level1 = wa_wba_fn(weight, sband1);
    a_level2 = wa_wba_fn(weight, sband2);

    % computation of match measure M_xy_mat:
    % normalized correlation averaged over a neighborhood of p:
    M_xy_mat = conv2((sband1.*sband2), rot90(weight,2),'same')./( (a_level1.^2) + (a_level2.^2));

    w_sband1 = 0.5 - 0.5*(1-M_xy_mat)/(1-thresh_alpha);
    w_sband1 = (w_sband1>=0).*w_sband1;
    w_sband2 = 1-w_sband1;

    % output of the function:
    combined_coef_mat = w_sband1.*sband1 + w_sband2.*sband2;


