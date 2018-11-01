%Load subject excel file
[d,s,r]=xlsread('subjects.xlsx');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

for k=1:length(s);

EEG = pop_loadset('filename','noBS_M+Correct.set','filepath',strcat('C:\EEGfiles\Research\WLNSF\DevDiff_Monolingual\\', s{k}, '\\'));
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
     
end

disp('LoadDataSets is done running');
