function mean_windowed = windowed_centered_mean(mat, m, n, zero_pad)
    % windowed average centered at position p(i,j) for subbands fusion
    % the function
    % to compute the MEAN matrix inside the eq.31 of the paper:
    % A wavelet-based image fusion tutorial
    % input: matrix for compute windowed mean, m, n --> length and width size of the window; zero_pad: logical, whether to use zero padding or periodical boundary conditioins for input mat
    % compute the mean value over a window m x n, centered at position p(i,j)


    [len, wid] = size(mat);
    mean_windowed = zeros(len, wid);
    for i=1:len
        for j=1:wid

            % set index for window centered at position i,j
            % i-floor(m/2);
            w_row_idx_start = i-floor(m/2);
            w_row_idx_end = w_row_idx_start+m-1;

            w_col_idx_start = j-floor(n/2);
            w_col_idx_end = w_col_idx_start+n-1;

            count = 1;
            for k=w_row_idx_start:w_row_idx_end
                for l=w_col_idx_start:w_col_idx_end
                    
                    % boundary condition:
                    if zero_pad==1
                        % zero padding for boundary condition:
                        if k<1 || l<1
                            % zero pad:
                            windowed_array(count) = 0;
                        elseif k>len || l>wid
                            % zero pad:
                            windowed_array(count) = 0;
                        else                
                            windowed_array(count) = mat(k,l);
                        end
                        
                    else
                        % Periodical boundary condition:
                        if k>=1 && k<=len && l>=1 && l<=wid
                            windowed_array(count) = mat(k,l);
                        elseif k<1 && l<1
                            windowed_array(count) = mat(len-abs(k),wid-abs(l));
                        elseif k<1 && l>=1 && l<=wid
                            windowed_array(count) = mat(len-abs(k),l);
                        elseif k<1 && l>wid
                            windowed_array(count) = mat(len-abs(k),l-wid);
                        elseif k>=1 && k<=len && l>wid
                            windowed_array(count) = mat(k,l-wid);
                        elseif k>len && l>wid
                            windowed_array(count) = mat(k-len,l-wid);
                        elseif k>len && l>=1 && l<=wid
                            windowed_array(count) = mat(k-len,l);
                        elseif k>len && l<1
                            windowed_array(count) = mat(k-len,wid-abs(l));
                        elseif k>=1 && k<=len && l<1
                            windowed_array(count) = mat(k,wid-abs(l));
                        end

                    end

                    count = count+1;
                end
            end

            mean_windowed(i,j) = mean(windowed_array(:));
            clear windowed_array;

        end
    end




