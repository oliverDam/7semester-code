
load('DR_EmgData30.mat')

FDR_EmgData30 = featureExtractionMovVar(DR_EmgData30(801:1400,:));

save('FDR_EmgData30.mat','FDR_EmgData30')

load('DR_EmgData50.mat')

FDR_EmgData50 = featureExtractionMovVar(DR_EmgData50(801:1400,:));

save('FDR_EmgData50.mat','FDR_EmgData50')

load('DR_EmgData80.mat')

FDR_EmgData80 = featureExtractionMovVar(DR_EmgData80(801:1400,:));

save('FDR_EmgData80.mat','FDR_EmgData80')