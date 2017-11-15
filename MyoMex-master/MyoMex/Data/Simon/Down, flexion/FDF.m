
load('DF_EmgData30.mat')

FDF_EmgData30 = featureExtractionMovVar(DE_EmgData30(801:1400,:));

save('FDF_EmgData30.mat','FDF_EmgData30')

load('DF_EmgData50.mat')

FDF_EmgData50 = featureExtractionMovVar(DE_EmgData80(801:1400,:));

save('FDF_EmgData50.mat','FDF_EmgData50')

load('DF_EmgData80.mat')

FDF_EmgData80 = featureExtractionMovVar(DE_EmgData80(801:1400,:));

save('FDF_EmgData80.mat','FDF_EmgData80')