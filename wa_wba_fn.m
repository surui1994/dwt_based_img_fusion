function activity_level = wa_wba_fn( weight, sband_mat )
    % the function to compute weigthed average window-based activity (WA-WBA) level of input sub-band at specific decomposition level and specific frequency band
    % input: weight matrix (squared matrix, 3x3 or 5x5); specific sub-band matrix from wavelet decomposition
    weight = transpose(weight);
    activity_level = conv2( abs(sband_mat), weight, 'same' );
    