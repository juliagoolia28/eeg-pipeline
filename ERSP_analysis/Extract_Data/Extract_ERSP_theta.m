 %load study with 30 subjects, 2 conditions, 2 groups (repeated measures)
%Left frontal: 'fp1','af3','f7','f5','f3','f1','ft7','fc5','fc3','fc1'
%Right frontal: 'fp2','af4','f2','f4','f6','f8','fc2','fc4','fc6','ft8'
%Left central:'t7','c5','c3','c1','tp7','cp5','cp3','cp1'
%Right central: 'c2','c4','c6','t8','cp2','cp4','cp6','tp8'
%Left parietal:'p7','p5','p3','p1','po7','po5','po3','o1','cb1'
%Right parietal:'p2','p4','p6','p8','po4','po6','po8','cb2','o2'

[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG,'channels',{'fp1','af3','f7','f5','f3','f1','ft7','fc5','fc3','fc1', 'af4','f2','f4','f6','f8','fc2','fc4','fc6','ft8','c1','tp7','cp5','cp3','cp1','c2','c4','c6','t8','cp2','cp4','cp6','tp8','p7','p5','p3','p1','po7','po5','po3','o1','cb1','p2','p4','p6','p8','po4','po6','po8','cb2','o2'}, 'freqrange', [4:8], 'timerange', [0:4000],'alpha', .05);%
 
%To determine the size/dimensions of a 4-D array:
%size(erspdata{1, 1}) %where erspdata{1,1} is the name of one 4-D double when opened
%output of erspdata is cond x group
%each element of ersp data is (freq,time,channel,subject)

%Condition by group averaging over channels
Adolescents= squeeze(mean(erspdata{1,1},2));
Children= squeeze(mean(erspdata{1,2},2));

SPSSexcel =[Children;Adolescents];
% Excel = [SPSSexcel,subjexport];

