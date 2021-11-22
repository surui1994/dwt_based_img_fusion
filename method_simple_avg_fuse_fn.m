function fsd_sband = method_simple_avg_fuse_fn(inp_wt,Nlevels)
    %* 1. fusion of ALL subbands of two input images, by the simple average method
    %* in the paper
    % A wavelet-based image fusion tutorial
    % input: inp_wt: subbands of all images to be fused, cell object
    % Nlevels: number of levels for DWT
    % output: fsd_sband: fused subbands cell object for all images, by general weighted average method

    % ! the test function for wavelet-based image fusion

    %* weight matrix will be used in weighted average combination method:
    w1=[1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9];
    w2=[2/15 2/15 2/15;2/15 2/15 2/15;1/15 1/15 1/15];
    w3=[4/21 2/21 1/21;4/21 2/21 1/21;4/21 2/21 1/21];
    w4=[8/35 4/35 2/35;8/35 4/35 2/35;4/35 2/35 1/35];


    NoOfBands=3*Nlevels+1;

    % weighted average method for low and high frequency subbands:
    for k=NoOfBands:-1:1
        
        sband1=cell2mat(inp_wt{1}(k));
        sband2=cell2mat(inp_wt{2}(k));

        fused_sband_mat = (sband1+sband2)*0.5;
        fsd_sband{k} = fused_sband_mat;

    end






