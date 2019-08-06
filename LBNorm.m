function [rank] = LBNorm(data,orig_row,num_crit)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%perform Lovasz-Bregman divergence normalized (calculate the average 
    %%p values for each gene)
    LBpValAvgNorm16 = zeros(orig_row,1);
    data_avg16 = mean(data,1);
    for i = 1:orig_row
       for j = 1:num_crit
           LBpValAvgNorm16(i,1)=LBpValAvgNorm16(i,1)+data(i,j)/data_avg16(1,j);
       end
    end
    LBpValAvgNorm16 = LBpValAvgNorm16/num_crit;
    [LBpValAvgNormSorted16,LBNormRank16] = sort(LBpValAvgNorm16,1,'ascend');
    rank = LBNormRank16;
end