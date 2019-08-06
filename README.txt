The software tool implements hybrid rank aggregation methods of toppgene and 
endeavour data.  MATLAB (of any version) is required for running this software.

1. "CrossValidationScript.m" is an example script for performing cross validation
 on a set of onset genes.  The asusmption is that there is a folder with a file
 for an onset genes (so there are *# of onset genes* files).  Each file is
  named ToppGeneData_*onsetgene*.xlsx, for example, "ToppGeneData_ADA.xlsx" for
  an onset gene "ADA".  Make sure that the folder does not contain any other files
  of format .xlsx.  CrossValidationScript.m takes the specified directory as the 
  input and outputs two files: Result.xlsx and onsetRank.xlsx.  Modify the script
  with your own directory containing the toppgene data files.  Result.xlsx 
  contains rankings of all genes for each file, separated by sheets in excel file.
  onsetRank.xlsx contains rankings of onset genes according to each file.  
  
 2. "EndeavourTrim.m" takes endeavour data as the input and outputs dataTrimmed, 
 containing only the p-values of each gene for criteria.  
 Thus, dataTrimmed is of the size (number of test genes) by (number of criteria).
 Example: [dataTrimmed, orig_row, num_crit, EndeavourRank] = EndeavourTrim(data);
 
 3. "HBweight.m" takes the trimmed data as the input and calculates weight to be
 applied for the Hybrid Borda method.  The use of weight is embedded in "WeightedHB.m"
 
 4. "Hungarian.m" finds the minimum weight matching in the bipartite matching graph.
 The code is obtained from the following source:
 "http://www.mathworks.com/matlabcentral/fileexchange/11609-hungarian-algorithm/content/Hungarian.m"
 Input to the Hungarian.m is an n by n matrix, where n is the number of test genes, 
 where entry ij indicates the weight of gene i to be ranked j.  
 "Hungarian.m" is used in Hybrid Kendall method.
 
 5. "LBNorm.m" takes the trimmed data, orig_row (number of test genes), num_crit as
 the input and outputs the Lovasz-Bregman Normalized ranking.
 Example: LBNormRank = LBNorm(dataTrimmed,orig_row,num_crit);
 
 6. "WeightedHB.m" takes the trimmed data, orig_row (number of test genes), num_crit
 as the input and outputs the Weighted Hybrid Borda ranking using the weight obtained via
 multiplying data by 1/(n-i+1); n = # test genes; i = tiedRank;
 Example: WeightedHBordaRank = WeightedHB(dataTrimmed,orig_row,num_crit);
 
 7. "WeightedHK.m" takes the trimmed data, orig_row (number of test genes), num_crit
 as the input and outputs the Weighted Hybrid Kendall ranking using the weight obtained via
 ((P_{i+1,j}-P_{i,j})/P_{i+1,j} + n*0.0001)*(1.05)^(n-i)
 Example: WeightedHKendallRank = WeightedHK(dataTrimmed,orig_row,num_crit);
  
 8. "ToppGeneTrim.m" takes toppgene data as the input and outputs dataTrimmed, 
 containing only the p-values of each gene for criteria.  
 Thus, dataTrimmed is of the size (number of test genes) by (number of criteria).
  Example: [dataTrimmed, orig_row, num_crit, EndeavourRank] = ToppGeneTrim(data);
 
 HOW TO RUN THE SOFTWARE:
 1. Load the file into matlab using "uiopen" or "xlsread" command.  Type "help uiopen" or 
 "help xlsread" on matlab for more information.
 2. Trim the data using either "EndeavourTrim.m" or "ToppGeneTrim.m", according to the data type.
 3. Perform LBNorm, WeightedHB, WeightedHK on dataTrimmed.  

 HOW TO RUN THE SAMPLE CODE (TestCodeAutism)
 1. Open "CrossValidationScript.m" on MATLAB and change lines 2, 16, 30, 31 to the directory containing 
 "TestCodeAutism" folder.  Make sure that 
 2. Run "CrossValidationScript.m"
 3. Result.xlsx and onsetRank.xlsx should match those in "TestCodeAutism\TestResult".  "Result.xlsx" 
 contains full ranking for all onset genes, and "onsetRank.xlsx" contains only the rankings of onset genes.