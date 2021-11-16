function mat_out = constcy_verf(mat_in)
    %%% perform consistency verification to input matrix
    % for selection method in image fusion 

    [r,c] = size(mat_in); 
    mat_out = zeros(r,c);
    for i=1:r
        for j=1:c
            s=0; t=0;
            if(i>1)
               s=s+mat_out(i-1,j); t=t+1;
            end
            if(j>1)
               s=s+mat_out(i,j-1); t=t+1;
            end
            if(i<r)
               s=s+mat_out(i+1,j); t=t+1;
            end
            if(j<c)
               s=s+mat_out(i,j+1); t=t+1;
            end
            if(i>1&&j>1)
               s=s+mat_out(i-1,j-1); t=t+1;
            end
            if(i>1&&j<c)
               s=s+mat_out(i-1,j+1); t=t+1;
            end
            if(i<r&&j>1)
               s=s+mat_out(i+1,j-1); t=t+1;
            end
            if(i<r&&j<c)
               s=s+mat_out(i+1,j+1); t=t+1;
            end
            if(s>t/2)
                mat_out(i,j)=1;
            elseif(s<t/2)
                   mat_out(i,j)=0;  
            end
        end
    end
    
end