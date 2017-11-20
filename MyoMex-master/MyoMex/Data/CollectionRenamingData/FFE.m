
load('FE_EmgData30.mat')

FFE_EmgData30 = featureExtractionMovVar(FE_EmgData30(801:1400,:));

save('FFE_EmgData30.mat','FFE_EmgData30')

load('FE_EmgData50.mat')

FFE_EmgData50 = featureExtractionMovVar(FE_EmgData50(801:1400,:));

save('FFE_EmgData50.mat','FFE_EmgData50')

load('FE_EmgData80.mat')

FFE_EmgData80 = featureExtractionMovVar(FE_EmgData80(801:1400,:));

save('FFE_EmgData80.mat','FFE_EmgData80')