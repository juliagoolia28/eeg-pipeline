%Written my Julie Schneider October 2018

codes= {  '111'  '112'  '113'  '121'  '122'  '123'  '211'  '212'  '213'  '221'  '222'  '223'  };%event codes to epoch
min= -0.5 %epoch minimum/onset
max= 1.5 %epoch maximum/offset

% set up paths
WLNSF_paths;

for s = [131 136 145 147 150] %EDIT FOR SUBJECT OF INTEREST (see subjects script for code)

    % get subject info, same name as subjects.m (function)
    [datafolder subject captype capchan capfile badcell] = WLNSF_correct_subjects(s);
    subject
    

        % make output dataset name        
        newsetname= [subject '_nobscor.set']; %output file new name

        clear EEG ALLEEG
        % start EEGLAB
        eeglab;
        
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename',[subject '_averef.set'],'filepath',[pathresearch subject filesep]);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, CURRENTSET );
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, codes , [min max], 'newname', [subject '_no_baseline'], 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename', newsetname,'filepath',[pathresearch subject filesep]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end
