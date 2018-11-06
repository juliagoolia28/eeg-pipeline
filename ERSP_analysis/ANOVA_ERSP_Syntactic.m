%load study with 30 subjects, 2 conditions, 2 groups (repeated measures)
 [STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG, 'channels',{'af4','fz','f2','f4','f6','f8','fc4','fc6','fc2','cp2','cp4','cp6','p2','p4','p6'},'freqrange', [13:30], 'timerange', [750:550],'alpha', .05);%
%[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG, 'channels', {'cz','cpz','cp2','cp4','pz','p2','p4','p6','po4','po6','po8'}, 'freqrange', [13:20], 'timerange', [600:750],'alpha', .05);%

%  pvals = std_stat(pcond), 'mode', 'fieldtrip', 'fieldtripmethod', 'montecarlo', 'condstats', 'on', 'fieldtripmcorrect', 'cluster';
 
%To determine the size/dimensions of a 4-D array:
%size(erspdata{1, 1}) %where erspdata{1,1} is the name of one 4-D double when opened
%output of erspdata is cond x group
%each element of ersp data is (freq,time,channel,subject)

%Condition by group averaging over channels
Correct_8= squeeze(mean(erspdata{1,1},3));
SynInt_8= squeeze(mean(erspdata{2,1},3));
SynOm_8= squeeze(mean(erspdata{3,1},3));

Correct_12= squeeze(mean(erspdata{1,2},3));
SynInt_12= squeeze(mean(erspdata{2,2},3));
SynOm_12= squeeze(mean(erspdata{3,2},3));

Correct_Adults= squeeze(mean(erspdata{1,3},3));
SynInt_Adults= squeeze(mean(erspdata{2,3},3));
SynOm_Adults= squeeze(mean(erspdata{3,3},3));

%Condition by group averaging over time points
Cor12_finalavg = squeeze(mean(Correct_12,2));
Cor8_finalavg = squeeze(mean(Correct_8,2));
CorA_finalavg = squeeze(mean(Correct_Adults,2));

SynInt12_finalavg = squeeze(mean(SynInt_12,2));
SynInt8_finalavg = squeeze(mean(SynInt_8,2));
SynIntA_finalavg = squeeze(mean(SynInt_Adults,2));

SynOm12_finalavg = squeeze(mean(SynOm_12,2));
SynOm8_finalavg = squeeze(mean(SynOm_8,2));
SynOmA_finalavg = squeeze(mean(SynOm_Adults,2));

%Condition by group averaging over freqs
Cor12 = squeeze(mean(Cor12_finalavg,1));
Cor8= squeeze(mean(Cor8_finalavg,1));
CorA = squeeze(mean(CorA_finalavg,1));

SynInt12 = squeeze(mean(SynInt12_finalavg,1));
SynInt8 = squeeze(mean(SynInt8_finalavg,1));
SynIntA = squeeze(mean(SynIntA_finalavg,1));

SynOm12 = squeeze(mean(SynOm12_finalavg,1));
SynOm8 = squeeze(mean(SynOm8_finalavg,1));
SynOmA = squeeze(mean(SynOmA_finalavg,1));

%Switch from hor to ver
Correct_12_mean = Cor12';
Correct_8_mean = Cor8';
Correct_A_mean = CorA';

SynInt_12_mean = SynInt12';
SynInt_8_mean = SynInt8';
SynInt_A_mean = SynIntA';

SynOm_12_mean = SynOm12';
SynOm_8_mean = SynOm8';
SynOm_A_mean = SynOmA';

Excel_8=[Correct_8_mean,SynInt_8_mean,SynOm_8_mean];
Excel_12=[Correct_12_mean,SynInt_12_mean,SynOm_12_mean];
Excel_Adult=[Correct_A_mean,SynInt_A_mean,SynOm_A_mean];

EXCEL=[Excel_8;Excel_12;Excel_Adult]