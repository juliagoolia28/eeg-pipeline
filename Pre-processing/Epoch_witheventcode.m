%setup directory
dir= '/Users/julieschneider/eeg-pipeline/Pre-processing/demo_data/'

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
 eeglab('redraw');
    
%load no baseline dataset
EEG = pop_loadset('filename','noBS_M+Correct.set','filepath',dir);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

%export events
EEG = eeg_checkset( EEG );
pop_expevents(EEG, [dir 'eventlist.csv'], 'samples');

%load in event data
data= readtable('eventlist.csv');
data= table2array(data);

%in column 2, identify any number above 200 and delete entire row
indices = find(data(:,2) >= 200);
data(indices,:) = [];
indices = find(data(:,2) == 12);
data(indices,:) = [];
indices = find(data(:,2) == 120);
data(indices,:) = [];

%input behavioral data (paste behavioral data in between the brackets)
newcol=[]';
data=[data newcol];

%reorganize behavioral data and add to new column (this data comes from the
%behavioral by condition database. As of right now, you must transpose the
%indivudals data into a new .csv file so their behavioral responses are in
%a single column-- needs to be revised. Alternatively, you can just copy
%and paste the row in as beh_data=[PASTE DATA] and delete the 1 in the
%repelem function at line 38).
beh_data=readtable([dir 'demo_behavioral.xlsx'],'ReadVariableNames',false);
beh_data= table2array(repelem(beh_data,3,1));
data=[data beh_data]; %cannot overcome the issue of inconsistent matrices

%Reject events that are incorrect
%in column 6, identify any number above and delete entire row
indices = find(data(:,6) ==0);
data(indices,:) = [];
indices = find(data(:,6) ==2);
data(indices,:) = [];

%save eventlist and epoch with remaining codes (see epoching script)
