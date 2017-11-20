
load('SE_EmgData30.mat')

FSE_EmgData30 = featureExtractionMovVar(SE_EmgData30(801:1400,:));

save('FSE_EmgData30.mat','FSE_EmgData30')

load('SE_EmgData50.mat')

FSE_EmgData50 = featureExtractionMovVar(SE_EmgData50(801:1400,:));

save('FSE_EmgData50.mat','FSE_EmgData50')

load('SE_EmgData80.mat')

FSE_EmgData80 = featureExtractionMovVar(SE_EmgData80(801:1400,:));

save('FSE_EmgData80.mat','FSE_EmgData80')