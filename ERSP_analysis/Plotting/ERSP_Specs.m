
%{
===================================ERSP_Specs Script===================================
Summary of function:
This script plots ERSP scalp map bins of specified widths for all electrodes.
You need to have a study loaded first.


Written by Vyom
8/24/2018
edited 1/7/2019
%}

%frequency range of interest
freq = [3 8];

%initial and final time points
initial = 0;
final = 1000;

%what electrode or electrode groups to plot? add more groups by adding a
%comma and starting a new group as {'elec1' 'elec2}
electrodes = { {'FCZ'}, {'FCZ' 'FC2' 'C2' 'F2'} };

%save images where?
saveDir = 'C:\Users\vmr160030\Desktop\ERSP specs\';

%what dimensions would you like for your images?
width = 650;
height = 650;


for elecGroup = 1:numel(electrodes)
    savePath = strcat(saveDir,'\elecGroup_',num2str(elecGroup),'_spectrogram.jpeg'); 
    STUDY = pop_statparams(STUDY, 'groupstats','on','condstats','on','naccu',1000,'method','perm','alpha',0.05);
    STUDY = pop_erspparams(STUDY, 'timerange',[initial final] ,'freqrange',freq );
    STUDY = std_erspplot(STUDY,ALLEEG,'channels',electrodes{1,elecGroup});
    fig1 = gcf;
    fig1.PaperUnits = 'points';
    fig1.PaperPosition = [0 0 width height];
    saveas(fig1,savePath);
    close(gcf);
end

disp('ERSP_Specs is done running');
