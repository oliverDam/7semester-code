
load('DU_EmgData30.mat')

FDU_EmgData30 = featureExtractionMovVar(DU_EmgData30(801:1400,:));

save('FDU_EmgData30.mat','FDU_EmgData30')

load('DU_EmgData50.mat')

FDU_EmgData50 = featureExtractionMovVar(DU_EmgData80(801:1400,:));

save('FDU_EmgData50.mat','FDU_EmgData50')

load('DU_EmgData80.mat')

FDU_EmgData80 = featureExtractionMovVar(DU_EmgData80(801:1400,:));

save('FDU_EmgData80.mat','FDU_EmgData80')