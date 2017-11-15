
load('SR_EmgData30.mat')

FSR_EmgData30 = featureExtractionMovVar(SR_EmgData30(801:1400,:));

save('FSR_EmgData30.mat','FSR_EmgData30')

load('SR_EmgData50.mat')

FSR_EmgData50 = featureExtractionMovVar(SR_EmgData50(801:1400,:));

save('FSR_EmgData50.mat','FSR_EmgData50')

load('SR_EmgData80.mat')

FSR_EmgData80 = featureExtractionMovVar(SR_EmgData80(801:1400,:));

save('FSR_EmgData80.mat','FSR_EmgData80')