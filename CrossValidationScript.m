%specify the directory with toppgene or endeavour files in .xlsx (excel) format 
source_dir = 'C:\Users\mkim158\Dropbox\Gene Prioritization_Bioinformatics\Code\TestCodeAutism\'  %modify for different directory
source_files = dir(fullfile(source_dir, '*.xlsx'));
%record which genes were target genes
OnsetGenes=zeros(length(source_files),1);
for page = 1:length(source_files)
    b(page,1) = cellstr(source_files(page).name);
    onsetName{page,1} = b{page,1}(14:end-5); %modify for different file name formats
    [NUMERIC,TXT,RAW] = xlsread(fullfile(source_dir, source_files(page).name));
    for i = 1:size(RAW,1)
       if strcmp(RAW{i,2}, onsetName{page,1})==1
           OnsetGenes(page,1)=i-1;
       end
    end
end
SUCCESS = xlswrite('C:\Users\mkim158\Dropbox\Gene Prioritization_Bioinformatics\Finalized Code\TestCodeAutism\onsetRank.xlsx',onsetName,'onsetName'); %modify
onsetRank = zeros(length(source_files),3);
for a = 1:length(source_files)
    data = xlsread(fullfile(source_dir, source_files(a).name));
    c(a,1) = cellstr(source_files(a).name);
    %Choose either ToppGeneTrim(data) or EndeavourTrim(data) for
    %appropriate file source
    [dataTrimmed, orig_row, num_crit, ToppGeneRank] = ToppGeneTrim(data);
    Result = zeros(orig_row, 3);
    Result(:,1) = LBNorm(dataTrimmed,orig_row,num_crit);
    Result(:,2) = WeightedHB(dataTrimmed,orig_row,num_crit);
    Result(:,3) = WeightedHK(dataTrimmed,orig_row,num_crit);
    [rankedRow1 rankedColumn1] = find(Result==OnsetGenes(a,1));
    onsetRank(a,:) = rankedRow1';
    SUCCESS1 = xlswrite('C:\Users\mkim158\Dropbox\Gene Prioritization_Bioinformatics\Code\TestCodeAutism\Result.xlsx',Result,c{a,1}); %modify
    SUCCESS2 = xlswrite('C:\Users\mkim158\Dropbox\Gene Prioritization_Bioinformatics\Code\TestCodeAutism\onsetRank.xlsx',onsetRank); %modify
end