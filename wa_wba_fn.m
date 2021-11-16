function activity_level = wa_wba_fn( weight, sband_mat )
    % Activity level computation method
    % the function to compute weigthed average window-based activity (WA-WBA) level of input sub-band at specific decomposition level and specific frequency band
    % input: weight matrix (squared matrix, 3x3 or 5x5); specific sub-band matrix from wavelet decomposition
    % to implement eq. 22 of the paper:
    % A wavelet-based image fusion tutorial

    % at first, rot weight matrix 180 degrees for conv operation:
    weight = rot90(weight,2);
    activity_level = conv2( abs(sband_mat), weight, 'same' );
    