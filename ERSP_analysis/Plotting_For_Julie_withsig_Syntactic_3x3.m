%Nouns versus Verbs M+ Only
[STUDY erspdata ersptimes erspfreqs pgroup pcond pinter] = std_erspplot(STUDY, ALLEEG, 'channels', {'af4','fz','f2','f4','f6','f8','fc4','fc6','fc2'}, 'freqrange', [12:31], 'timerange', [-100:1000], 'groupstats', 'on', 'condstats','on', 'alpha', .05);%

%  pvals = std_stat(pcond), 'mode', 'fieldtrip', 'fieldtripmethod', 'montecarlo', 'condstats', 'on', 'fieldtripmcorrect', 'cluster';
 
%To determine the size/dimensions of a 4-D array:
%size(erspdata{1, 1}) %where erspdata{1,1} is the name of one 4-D double when opened
%output of erspdata is cond x group
%each element of ersp data is (freq,time,channel,subject)

%Condition by group averaging over channels
Correct_8= squeeze(mean(erspdata{1,1},3));
SynInt_8= squeeze(mean(erspdata{1,2},3));
SynOm_8= squeeze(mean(erspdata{1,3},3));

Correct_12= squeeze(mean(erspdata{2,1},3));
SynInt_12= squeeze(mean(erspdata{2,2},3));
SynOm_12= squeeze(mean(erspdata{2,3},3));

Correct_Adults= squeeze(mean(erspdata{3,1},3));
SynInt_Adults= squeeze(mean(erspdata{3,2},3));
SynOm_Adults= squeeze(mean(erspdata{3,3},3));

%compute interaction
pinter_comb=[pinter{1,1}, pinter{1,2}, pinter{1,3}]

%Stats by condition averaging over channels
Twelve_sig = squeeze(mean(pcond{1,1},3));
Eight_sig = squeeze(mean(pcond{1,2},3));
A_sig = squeeze(mean(pcond{1,3},3));
Cor_sig = squeeze(mean(pgroup{1,1},3));
SynInt_sig = squeeze(mean(pgroup{1,2},3));
SynOm_sig = squeeze(mean(pgroup{1,3},3));
Interaction_sig= squeeze(mean(pinter_comb,3));

%Condition by group averaging over subjects
Cor12_finalavg = squeeze(mean(Correct_12,3));
Cor8_finalavg = squeeze(mean(Correct_8,3));
CorA_finalavg = squeeze(mean(Correct_Adults,3));

SynInt12_finalavg = squeeze(mean(SynInt_12,3));
SynInt8_finalavg = squeeze(mean(SynInt_8,3));
SynIntA_finalavg = squeeze(mean(SynInt_Adults,3));

SynOm12_finalavg = squeeze(mean(SynOm_12,3));
SynOm8_finalavg = squeeze(mean(SynOm_8,3));
SynOmA_finalavg = squeeze(mean(SynOm_Adults,3));

%Changing order so you can use tftopo to plot. must be in order of
%(times,freq)
Cor12avgplot=permute(Cor12_finalavg,[2 1]); 
Cor8avgplot=permute(Cor8_finalavg,[2 1]);
CorAavgplot=permute(CorA_finalavg,[2 1]);
SynInt12avgplot=permute(SynInt12_finalavg,[2 1]);
SynInt8avgplot=permute(SynInt8_finalavg,[2 1]);
SynIntAavgplot=permute(SynIntA_finalavg,[2 1]);
SynOm12avgplot=permute(SynOm12_finalavg,[2 1]);
SynOm8avgplot=permute(SynOm8_finalavg,[2 1]);
SynOmAavgplot=permute(SynOmA_finalavg,[2 1]);

%For stats, changing order so you can use tftopo to plot. must be in order of
%(times,freq)
C12_sig_avgplot=permute(Twelve_sig,[2 1]); 
C8_sig_avgplot=permute(Eight_sig,[2 1]);
A_sig_avgplot=permute(A_sig,[2 1]);
Corsig_avgplot=permute(Cor_sig,[2 1]);
SynIntsig_avgplot=permute(SynInt_sig,[2 1]);
SynOmsig_avgplot=permute(SynOm_sig,[2 1]);
Intersig_avgplot= permute(Interaction_sig, [2 1]);

%Playing with statistics
% pvals = std_stat({erspDiff_C1C2_G1 zeros(size(erspDiff_C1C2_G1)) }', mode', 'fieldtrip', 'fieldtripmethod', 'montecarlo', 'condstats', 'on', 'fieldtripmcorrect', 'cluster');

%Plotting ERSP by Group and Conditions
 find_limits=cat(3,SynInt12avgplot,SynInt8avgplot,SynIntAavgplot,Cor12avgplot,Cor8avgplot,CorAavgplot,SynOm8avgplot,SynOm12avgplot,SynOmAavgplot);
    limit_min=-max(abs(find_limits(:)));
    limit_max=max(abs(find_limits(:)));
    figure      
            subplot(4,4,5)
            tftopo(Cor8avgplot,ersptimes,erspfreqs,'title',['Correct 12' ],'limits',[nan nan nan nan limit_min limit_max]);    
            subplot(4,4,6)
            tftopo(Cor12avgplot,ersptimes,erspfreqs,'title',['Intrusion 12' ],'limits',[nan nan nan nan limit_min limit_max]);  
            subplot(4,4,7)
            tftopo(CorAavgplot,ersptimes,erspfreqs,'title',['Omission 12' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,8)
            tftopo(Corsig_avgplot,ersptimes,erspfreqs,'title',['12 Significance' ],'limits',[nan nan nan nan limit_min limit_max]);
            subplot(4,4,1)
            tftopo(SynInt8avgplot,ersptimes,erspfreqs,'title',['Correct 8' ],'limits',[nan nan nan nan limit_min limit_max]);  
            subplot(4,4,2)
            tftopo(SynInt12avgplot,ersptimes,erspfreqs,'title',['Intrusion 8' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,3)
            tftopo(SynIntAavgplot,ersptimes,erspfreqs,'title',['Omission 8' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,4)
            tftopo(SynIntsig_avgplot,ersptimes,erspfreqs,'title',['8 Significance' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,9)
            tftopo(SynOm8avgplot,ersptimes,erspfreqs,'title',['Correct Adult' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,10)
            tftopo(SynOm12avgplot,ersptimes,erspfreqs,'title',['Intrusion Adult' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,11)
            tftopo(SynOmAavgplot,ersptimes,erspfreqs,'title',['Omission Adult' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,12)
            tftopo(SynOmsig_avgplot,ersptimes,erspfreqs,'title',['Adult Significance' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,13)
            tftopo(C8_sig_avgplot,ersptimes,erspfreqs,'title',['Correct Significance' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,14)
            tftopo(C12_sig_avgplot,ersptimes,erspfreqs,'title',['Intrusion Significance' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,15)
            tftopo(A_sig_avgplot,ersptimes,erspfreqs,'title',['Omission Significance' ],'limits',[nan nan nan nan limit_min limit_max]); 
            subplot(4,4,16)
            tftopo(Intersig_avgplot,ersptimes,erspfreqs,'title',['Interaction Significance' ],'limits',[nan nan nan nan limit_min limit_max]); 

            
            
            set(gcf, 'color', 'w')                                          %changing the background to white
             % Create colorbar
            
            axes('Position', [.9 .35 .07 .33], 'Visible', 'off');
            c=colorbar ('FontSize',10);
            ylabel(c,'dB')
            caxis([limit_min limit_max])
            
            
            
  