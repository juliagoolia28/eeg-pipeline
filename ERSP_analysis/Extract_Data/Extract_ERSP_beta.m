%Interaction
[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG,'channels',{'f7','f5','ft7','fc5','fc3','c1','c3','c5'}, 'freqrange', [13:30], 'timerange', [0:4000],'alpha', .05);%
 
%To determine the size/dimensions of a 4-D array:
%size(erspdata{1, 1}) %where erspdata{1,1} is the name of one 4-D double when opened
%output of erspdata is cond x group
%each element of ersp data is (freq,time,channel,subject)

%Condition by group averaging over channels
Children_1= squeeze(mean(erspdata{1,2},2));
Children_3= squeeze(mean(erspdata{3,2},2));

Beta_Young = [Children_3-Children_1];

Adol_1= squeeze(mean(erspdata{1,1},2));
Adol_3= squeeze(mean(erspdata{3,1},2));

Beta_Old = [Adol_3-Adol_1];

subjexport={ALLEEG.subject}';
subjexport([89:109],:) = [];

Beta = [Beta_Young;Beta_Old];
SPSSexcel =[subjexport,Beta];
% Excel = [SPSSexcel,subjexport];

