对论文“A wavelet-based image fusion tutorial”中的相关公式进行复现，采用MATLAB语言。

重要的参考github中的代码：
1. Classic-and-state-of-the-art-image-fusion-methods：(https://github.com/thfylsty/Classic-and-state-of-the-art-image-fusion-methods.git)
  1.1 DCHWT_Image_Fusion_Codes：
      wt_fusion_pgm.m, method2_sivip2011_fn.m

  1.2 GTF/A general framework for image fusion based on multi-scale transform and sparse representation
      dwt_fuse.m, selc.m

2. image-fusion: (https://github.com/Rajnish-Ranjan/image-fusion.git)
  2.1 code:
       fusion.m --> 其中的weight matrix for coefficient combination 比较重要

fusion method:
- simple average
- weighted average


