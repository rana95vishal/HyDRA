function [dataTrimmed, orig_row, num_crit, ToppGeneRank] = ToppGeneTrim(data)
    %%Trim the data such that it only has scores (p values)
    orig_row = size(data,1); %original row = number of candidates (genes)
    orig_col = size(data,2); %original column
    num_crit = (orig_col-3)/2 - 1; %number of voters(criteria) used for ToppGene

    ToppGeneRank = data(:,1);

    % geneHGNC = textdata(2:(orig_row+1),2); %candidate genes list
    % critList = cell(1,num_crit); %list of criteria used
    % for i = 2: (orig_col-3)/2
    %     critList(1,i-1) = textdata(1,2*i);
    % end
    % critList = strrep(critList(1,:),'Score','');

    %get rid of all columns other tha p values
    for i = 1:3
       data(:,1)=[]; 
    end

    for j = 1:num_crit
       data(:,j)=[];
    end

    %get rid of overall score & p values
    data(:,num_crit+1)=[];
    data(:,num_crit+1)=[];
    
    dataTrimmed = data;

end