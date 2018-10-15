pathinput = 'K:\Dept\CallierResearch\Maguire\Epoched Data\WLNSF\FinalWord\';
pathoutput = 'C:\EEGfiles\Research\WLNSF\LowSES_Learners\';

for s = [1:30] %EDIT FOR SUBJECT OF INTEREST (see subjects script for code)

    % get subject info, same name as subjects.m (function)
    [subject] = LowSES_subjects(s);
    subject
copyfile ([pathinput subject], [pathoutput subject])

end
