function error = e_rms(in, est)
    % the function to compute the root mean square error of the difference
    % between the input (fused) image and est (perfect) image

    e = in - est;
    error = ( mean( e(:).^2 ) )^0.5;
    