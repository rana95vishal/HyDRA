function [rank] = WeightedHB(data,orig_row,num_crit)
    weight_multiplier4=HBweight(data,orig_row,num_crit);
    WeightedBordaTotalScores4 = zeros(orig_row,1);
    Weightedtempsum4 = zeros(orig_row, num_crit);
    for j = 1:orig_row %for gene 1, 2, .., orig_row
        for k = 1:num_crit %go through each criteria
            for l = 1:orig_row 
                if data(l,k)>=data(j,k)
                    Weightedtempsum4(j,k)=Weightedtempsum4(j,k)+weight_multiplier4(l,k)*data(l,k);
                end
            end
             Weightedtempsum4(j,k)=(Weightedtempsum4(j,k)-weight_multiplier4(j,k)*data(j,k))/(weight_multiplier4(j,k)*data(j,k));
        end
    end
    WeightedBordaTotalScores4 = sum(Weightedtempsum4,2);
    [WeightedBordaTotalScoresSorted4,WHybridBordaRank4] = sort(WeightedBordaTotalScores4,1,'descend');

    rank = WHybridBordaRank4;

end