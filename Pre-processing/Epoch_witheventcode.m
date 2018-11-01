%load no baseline dataset
EEG = pop_loadset('filename','NoBS_M+Correct.set','filepath','/Volumes/CallierResearch/Maguire/Epoched Data/WLNSF/FinalWordNoBS/111216_1f_10y/');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

%export events
EEG = eeg_checkset( EEG );
pop_expevents(EEG, '/Volumes/CallierResearch/Maguire/Epoched Data/WLNSF/FinalWordNoBS/111216_1f_10y/eventlist.csv', 'samples');

%load in event data
data = readtable('eventlist.csv');
data= table2array(data);

%in column 2, identify any number above 200 and delete entire row
indices = find(data(:,2) >= 200);
data(indices,:) = [];

%input behavioral data (paste behavioral data in between the brackets)
newcol=[]';
data=[data newcol];

