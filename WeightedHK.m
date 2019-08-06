function [rank] = WeightedHK(data,orig_row,num_crit)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %4) ((P_{i+1,j}-P_{i,j})/P_{i+1,j} + n*0.0001)*(1.05)^(n-i)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [dataSorted, dataSortedIndex] = sort(data,1,'ascend');
    rankings = dataSortedIndex';
    swapCost4 = zeros(orig_row-1, num_crit);
    for i = 1 : orig_row-1
        for j = 1 : num_crit
            % modify the following line to use different weight function
           swapCost4(i,j) = ((dataSorted(i+1,j) - dataSorted(i,j))/dataSorted(i+1,j)+orig_row*0.0001)*(1.05)^(orig_row-i);
        end
    end
    swapCost4 = swapCost4*10;
    [m n] = size(rankings);
    C4 = zeros(n); % C(i,j) is the weight of the edge ij in the 
    % bipartite graph (cost of putting item j in position i)
    for i = 1:n  %gene i
       for j = 1:n %position j
           c4 = 0;
           for k = 1:num_crit
               [row col] = find(dataSortedIndex==i);
               for m = min(j, row(k,1)):max(j, row(k,1))-1
                  c4 = c4 +  swapCost4(m,k);
               end
           end
           C4(i,j) = c4;
       end
    end
    C4 = C4/num_crit;
    [Matching4, Cost] = Hungarian(C4);
    [WHybridKendallRank4 col_hung] = find(Matching4);
    rank = WHybridKendallRank4;
end