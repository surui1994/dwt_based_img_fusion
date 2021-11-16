function rba_image = rba_image_fuse_fn( inp_wt, Nlevels,idx_x, idx_y, m, n )
    % compute region based activity (RBA) measurement for all images to be fused
    % to implement eq.24 of the paper:
    % A wavelet-based image fusion tutorial

    % input parameter of the function:
    %! inp_wt: cell object, cointaining wavelet transformed subbands of all images to be fused
    % Nlevels, 
    % idx_x, idx_y, m, n: start row and column index of the region in low frequency subband
    % and m, n: row and column length for the region
    %* output of the function: rba_image: cell object storing region based activity level of all images to be fused

    NoOfBands=3*Nlevels+1;

    for img_idx=1:2
        % k=NoOfBands;
        % k=k-1;
        k=1;

        pow = 0;
        activity_level_tmp = [];
        % to loop over all high frequency subbands:
        for i=Nlevels:-1:1

            %% get the detail matrix (high frequency images) for each decomposition level:
            V=cell2mat(inp_wt{img_idx}(k+2));
            H=cell2mat(inp_wt{img_idx}(k+1));
            D=cell2mat(inp_wt{img_idx}(k));

            % activity level measurement:
            % power can be 2 or 1
            a_v = (abs(V)).^2;
            a_h = (abs(H)).^2;
            a_d = (abs(D)).^2;

            % compute region based activity level measurement:
            m = m*(2^pow); n = n*(2^pow);
            row_start = (idx_x-1)*(2^pow)+1;
            col_start = (idx_y-1)*(2^pow)+1;
            
            % flatten to 1D array:
            tmp_v = reshape(a_v(row_start:row_start+m-1, col_start:col_start+n-1), 1,[]);
            tmp_h = reshape(a_h(row_start:row_start+m-1, col_start:col_start+n-1), 1,[]);
            tmp_d = reshape(a_d(row_start:row_start+m-1, col_start:col_start+n-1), 1,[]);

            % concat all flattened 1D array:
            activity_level_tmp = [ activity_level_tmp tmp_v tmp_h tmp_d ];



            k=k+3;
            pow = pow+1;
        end
        % after looping over all high frequency subbands, compute region based activity level measurement, stored in the cell object:
        rba_image{img_idx} = mean(activity_level_tmp(:));

    end

    


