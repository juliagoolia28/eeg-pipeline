%Younger Children
[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG,'channels',{'cp5','cp3','cp4','cp6','tp8','p5','p3','po7','po5','po3','oz','o1','cb1','p4','p6','p8','po4','po6','po8','cb2','o2'}, 'freqrange', [9:12], 'timerange', [0:4000],'alpha', .05);%
 
%To determine the size/dimensions of a 4-D array:
%size(erspdata{1, 1}) %where erspdata{1,1} is the name of one 4-D double when opened
%output of erspdata is cond x group
%each element of ersp data is (freq,time,channel,subject)

%Condition by group averaging over channels
Children_1= squeeze(mean(erspdata{1,2},2));
Children_3= squeeze(mean(erspdata{3,2},2));

Alpha_Young = [Children_3-Children_1];

%Older Children
[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG,'channels',{'cp5','cp3','p7','p5','p3','p1','pz','po7','po5','po3','poz','oz','o1','cb1','p2','p4','p6','p8','po4','po6','po8','cb2','o2','cp2','cp4','cp6','tp8','cz','c2','fc1','fcz','fc2','fc4','fp2','af4','f2','f4','f6','f8','fp1','af3','f7','f5','f3','f1','fz'}, 'freqrange', [9:12], 'timerange', [0:4000],'alpha', .05);%

Adol_1= squeeze(mean(erspdata{1,1},2));
Adol_3= squeeze(mean(erspdata{3,1},2));

Alpha_Old = [Adol_3-Adol_1];

subjexport={ALLEEG.subject}';
subjexport([89:109],:) = [];

Alpha = [Alpha_Young;Alpha_Old];
SPSSexcel =[subjexport,Alpha];
% Excel = [SPSSexcel,subjexport];

