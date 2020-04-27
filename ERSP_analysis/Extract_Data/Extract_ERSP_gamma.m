%Interaction
[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG,'channels',{'fp1','f3','f5','f7','f2','f4','f6','fc3','fc5','ft7','fc4','ft8','fcz','t7','c6','t8','cpz','cp5','cp7','cp4','cp6','p2','p6','p8','p7','poz','po1','po5','po7','po4','po6','po8','oz','o1','o2'}, 'freqrange', [30:50], 'timerange', [0:4000],'alpha', .05);%
 
%To determine the size/dimensions of a 4-D array:
%size(erspdata{1, 1}) %where erspdata{1,1} is the name of one 4-D double when opened
%output of erspdata is cond x group
%each element of ersp data is (freq,time,channel,subject)

%Condition by group averaging over channels
Adol_1= squeeze(mean(erspdata{1,1},2));
Adol_3= squeeze(mean(erspdata{3,1},2));

Gamma_Old = [Adol_3-Adol_1];



