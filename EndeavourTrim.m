function [dataTrimmed, orig_row, num_crit, EndeavourRank] = EndeavourTrim(data)
    %some lines in this file have been mmodified to work with the output file from Endeavor after the updates in their web portal and data sources
    %original code has been commented out at places
    
    orig_row = size(data,1);
    orig_col = size(data,2);
    %num_crit = (orig_col-3)/3;
    num_crit = orig_col - 2;
    %EndeavourRank = data(:,1);
    EndeavourRank = data(:,orig_col);
    %get rid of all columns other tha p values
    
    %for i = 1:5
    %   data(:,1)=[]; 
    %end

    %for j = 2:num_crit
    %   data(:,j)=[];
    %   data(:,j)=[];
    %end

    maximum = max(data,[],1);
    minimum = min(data,[],1);

    for i = 1:orig_row
        for j = 1:num_crit
            if isnan(data(i,j))==1
                data(i,j)=(maximum(1,j)+minimum(1,j))/2;
            end        
        end
    end

    %dataTrimmed = data;
    dataTrimmed = data(:,2:num_crit);

end
