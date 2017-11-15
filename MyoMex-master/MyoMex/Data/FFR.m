
load('FR_EmgData30.mat')

FFR_EmgData30 = featureExtractionMovVar(FR_EmgData30(801:1400,:));

save('FFR_EmgData30.mat','FFR_EmgData30')

load('FR_EmgData50.mat')

FFR_EmgData50 = featureExtractionMovVar(FR_EmgData50(801:1400,:));

save('FFR_EmgData50.mat','FFR_EmgData50')

load('FR_EmgData80.mat')

FFR_EmgData80 = featureExtractionMovVar(FR_EmgData80(801:1400,:));

save('FFR_EmgData80.mat','FFR_EmgData80')