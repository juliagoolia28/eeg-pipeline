%Establish path to copy from
pathinput = 'K:\Dept\CallierResearch\Maguire\Epoched Data\WLNSF\FinalWord\';
%Establish path to create and copy to
pathoutput = 'C:\EEGfiles\Research\WLNSF\DevDiff_Monolingual\';
%Load excel list of subjects
[d,s,r]=xlsread('subjects.xlsx');

for k=1:length(s); 

copyfile ([pathinput (s{k})], [pathoutput (s{k})])

end
