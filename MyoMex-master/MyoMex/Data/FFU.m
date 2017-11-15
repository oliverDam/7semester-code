
load('FU_EmgData30.mat')

FFU_EmgData30 = featureExtractionMovVar(FU_EmgData30(801:1400,:));

save('FFU_EmgData30.mat','FFU_EmgData30')

load('FU_EmgData50.mat')

FFU_EmgData50 = featureExtractionMovVar(FU_EmgData50(801:1400,:));

save('FFU_EmgData50.mat','FFU_EmgData50')

load('FU_EmgData80.mat')

FFU_EmgData80 = featureExtractionMovVar(FU_EmgData80(801:1400,:));

save('FFU_EmgData80.mat','FFU_EmgData80')