%load study with 30 subjects, 2 conditions, 2 groups (repeated measures)

%'fp1','fpz','fp2','af3','af4','f7','f5','f3','f1','fz','f2','f4','f6','f8','ft7','fc5','fc3','fc1','fcz','fc2','fc4','fc6','ft8','t7','c5','c3','c1','cz','c2','c4','c6','t8','tp7','cp5','cp3','cp1','cpz','cp2','cp4','cp6','tp8','p7','p5','p3','p1','pz','p2','p4','p6','p8','po7','po5','po3','poz','po4','po6','po8','o1','oz',o2','cb1','cb2'
%Left frontal: 'fp1','fpz','af3','f7','f5','f3','f1','fz','ft7','fc5','fc3','fc1','fcz'
%Right frontal: 'fpz','fp2','af4','fz','f2','f4','f6','f8','fcz','fc2','fc4','fc6','ft8'
%Left central:'t7','c5','c3','c1','cz','tp7','cp5','cp3','cp1','cpz'
%Right central: 'cz','c2','c4','c6','t8','cpz','cp2','cp4','cp6','tp8'
%Left parietal:'p7','p5','p3','p1','pz','po7','po5','po3','poz','o1','oz','cb1'
%Right parietal:'pz','p2','p4','p6','p8','poz','po4','po6','po8','cb2','oz','o2'
[STUDY erpdata erptimes pgroup pcond pinter] = std_erpplot(STUDY, ALLEEG, 'channels', {'tp7','po7','po5','po3','p3','p5','p7'}, 'timerange', [550:750]);%
%  pvals = std_stat(pcond), 'mode', 'fieldtrip', 'fieldtripmethod', 'montecarlo', 'condstats', 'on', 'fieldtripmcorrect', 'cluster';
 
%Condition by group averaging over channels
Correct_12= squeeze(mean(erpdata{1,1},2));
Correct_8= squeeze(mean(erpdata{1,2},2));
Correct_Adults= squeeze(mean(erpdata{1,3},2));

Int_12= squeeze(mean(erpdata{2,1},2));
Int_8= squeeze(mean(erpdata{2,2},2));
Int_Adults= squeeze(mean(erpdata{2,3},2));

Om_12= squeeze(mean(erpdata{3,1},2));
Om_8= squeeze(mean(erpdata{3,2},2));
Om_Adults= squeeze(mean(erpdata{3,3},2));

%Condition by group averaging over time points
Cor12_finalavg = squeeze(mean(Correct_12,1));
Cor8_finalavg = squeeze(mean(Correct_8,1));
CorA_finalavg = squeeze(mean(Correct_Adults,1));

Int12_finalavg = squeeze(mean(Int_12,1));
Int8_finalavg = squeeze(mean(Int_8,1));
IntA_finalavg = squeeze(mean(Int_Adults,1));

Om12_finalavg = squeeze(mean(Om_12,1));
Om8_finalavg = squeeze(mean(Om_8,1));
OmA_finalavg = squeeze(mean(Om_Adults,1));

%Switch from hor to ver
Correct_12_mean = Cor12_finalavg';
Correct_8_mean = Cor8_finalavg';
Correct_A_mean = CorA_finalavg';

Int_12_mean = Int12_finalavg';
Int_8_mean = Int8_finalavg';
Int_A_mean = IntA_finalavg';

Om_12_mean = Om12_finalavg';
Om_8_mean = Om8_finalavg';
Om_A_mean = OmA_finalavg';

Excel_8= [Correct_8_mean,Int_8_mean,Om_8_mean];
Excel_12= [Correct_12_mean,Int_12_mean,Om_12_mean];
Excel_A= [Correct_A_mean,Int_A_mean,Om_A_mean];

EXCEL=[Excel_8;Excel_12;Excel_A]

% % %Remove last row of MM3 to ensure they are balanced groups
%  Error_12_mean(48) = [];
%  Error_8_mean(48) = [];
%  Error_A_mean(48) = [];

%ANOVA
% display Meaning_Plus_Nouns
% MP=[Correct_12_mean;Correct_8_mean;Correct_A_mean];
% SentNum = [ones(47,1);ones(47,1).*2;ones(47,1).*3];
% S = 1:47;
% Subject = [S';S';S'];
% ANOVA_data_MP=[MP SentNum Subject];
% RMAOV1(ANOVA_data_MP,.05)
% % Y=[MP1,MP2,MP3];
% % [p,tbl,stats]=anova1(Y)
% 
% display Meaning_Minus_Nouns
% MM=[Error_12_mean;Error_8_mean;Error_A_mean];
% SentNum = [ones(47,1);ones(47,1).*2;ones(47,1).*3];
% S = 1:47;
% Subject = [S';S';S'];
% ANOVA_data_MM=[MM SentNum Subject];
% RMAOV1(ANOVA_data_MM,.05)
% % X=[MM1,MM2,MM3];
% % [p,tbl,stats]=anova1(X)
% 
% display Nouns_Meaning_ConditionXPresentation
% % MP_MM_Data = [Y;X];
% % [p,tbl,stats]=anova1(MP_MM_Data,2);
% Meaning = [ones(141,1);ones(141,1).*2];
% Pres = [ones(47,1);ones(47,1).*2;ones(47,1).*3; ones(47,1);ones(47,1).*2;ones(47,1).*3;];
% S = 1:47;
% Subject = [S';S';S';S';S';S'];
% OMNIBUS_ANOVA_data=[MP_MM_Data Meaning Pres Subject];
% RMAOV2(OMNIBUS_ANOVA_data,.05)
