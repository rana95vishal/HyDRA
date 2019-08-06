function [HBweight] = HBweight(data,orig_row,num_crit) 
    index = tiedrank(data);
    %4) Multiply data by 1/(n-i+1); n = # test genes; i = tiedRank;
    %%%%%%%modify this file to use different weights for Hybrid Borda%%%
    HBweight = zeros(orig_row,num_crit);
    for i = 1:num_crit
        for j = 1:orig_row
            HBweight(j,i) = 1/(orig_row-index(j,i)+1);  
        end
    end
end