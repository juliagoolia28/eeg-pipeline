#!/bin/bash

# Only use this script if you are running a participant through feat for the first time.  This is a three-step process combined into one script. 

# make a log file which outputs any errors. Change the name of the log file everytime you run this.
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>Feat_first_level_7_log.out 2>&1

# specify folder where participant folders exist
cd /Volumes/CallierResearch/Maguire/Epoched\ Data/Theme_Cat/ERP

# specify which participants you want to run through.  If you want to change the participants, change the contents of the subject.list.txt file
flist=$(cat /Volumes/CallierResearch/Maguire/Epoched\ Data/Theme_Cat/ERP/subject.list.txt)

# runs a nested loop where for each participant you specified, it will copy the main design file and put a copy of that in each participant's folder.  It then searches those participant and run-specific design files for "001", and replaces it with the correct participant's ID.  Finally, it runs Feat for each participant run.

for subject in $flist;
	do
		#mv /Volumes/CallierResearch/Maguire/Epoched\ Data/Theme_Cat/ERP/${subject}/ERPall.erp /Volumes/CallierResearch/Maguire/Epoched\ Data/Theme_Cat/ERP/${subject}/${subject}_ERPall.erp
		cp /Volumes/CallierResearch/Maguire/Epoched\ Data/Theme_Cat/ERP/${subject}/${subject}_ERPall.erp /Volumes/CallierResearch/Maguire/Epoched\ Data/Theme_Cat/ERP/ERP_outputs_12.10/
done
