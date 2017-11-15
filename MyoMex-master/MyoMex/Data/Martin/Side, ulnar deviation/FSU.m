
load('SU_EmgData30.mat')

FSU_EmgData30 = featureExtractionMovVar(SU_EmgData30(801:1400,:));

save('FSU_EmgData30.mat','FSU_EmgData30')

load('SU_EmgData50.mat')

FSU_EmgData50 = featureExtractionMovVar(SU_EmgData50(801:1400,:));

save('FSU_EmgData50.mat','FSU_EmgData50')

load('SU_EmgData80.mat')

FSU_EmgData80 = featureExtractionMovVar(SU_EmgData80(801:1400,:));

save('FSU_EmgData80.mat','FSU_EmgData80')