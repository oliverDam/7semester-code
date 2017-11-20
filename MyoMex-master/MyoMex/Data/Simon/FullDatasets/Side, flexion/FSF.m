
load('SF_EmgData30.mat')

FSF_EmgData30 = featureExtractionMovVar(SF_EmgData30(801:1400,:));

save('FSF_EmgData30.mat','FSF_EmgData30')

load('SF_EmgData50.mat')

FSF_EmgData50 = featureExtractionMovVar(SF_EmgData50(801:1400,:));

save('FSF_EmgData50.mat','FSF_EmgData50')

load('SF_EmgData80.mat')

FSF_EmgData80 = featureExtractionMovVar(SF_EmgData80(801:1400,:));

save('FSF_EmgData80.mat','FSF_EmgData80')