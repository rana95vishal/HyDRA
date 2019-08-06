function [dataTrimmed, orig_row, num_crit, EndeavourRank] = EndeavourTrim(data)
    orig_row = size(data,1);
    orig_col = size(data,2);
    num_crit = (orig_col-3)/3;
    EndeavourRank = data(:,1);
    %get rid of all columns other tha p values
    for i = 1:5
       data(:,1)=[]; 
    end

    for j = 2:num_crit
       data(:,j)=[];
       data(:,j)=[];
    end

    maximum = max(data,[],1);
    minimum = min(data,[],1);

    for i = 1:orig_row
        for j = 1:num_crit
            if isnan(data(i,j))==1
                data(i,j)=(maximum(1,j)+minimum(1,j))/2;
            end        
        end
    end

    dataTrimmed = data;

end