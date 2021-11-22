
% this is the script to verify variables inside multiple loop operation.
% which is from stable matlab code
% from github: 
% https://github.com/thfylsty/Classic-and-state-of-the-art-image-fusion-methods.git
% DCHWT_Image_Fusion_Codes/method2_sivip2011_fn.m

Nlevels = 3;
NoOfBands=3*Nlevels+1;
for k=NoOfBands-1:-1:4
   rr=1;
   level_cnt=Nlevels-ceil(k/3)+1;
    
    disp(["k: ",k, ", level_cnt: ", level_cnt]);

   for mm=level_cnt:Nlevels
       disp(["   mm: ",mm, "rr: ", rr, "k-3*(mm-level_cnt): ", k-3*(mm-level_cnt)]);
       rr=rr+1;
      
   end
end
