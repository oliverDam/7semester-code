
load('DE_EmgData30.mat')

FDE_EmgData30 = featureExtractionMovVar(DE_EmgData30(801:1400,:));

save('FDE_EmgData30.mat','FDE_EmgData30')

load('DE_EmgData50.mat')

FDE_EmgData50 = featureExtractionMovVar(DE_EmgData80(801:1400,:));

save('FDE_EmgData50.mat','FDE_EmgData50')

load('DE_EmgData80.mat')

FDE_EmgData80 = featureExtractionMovVar(DE_EmgData80(801:1400,:));

save('FDE_EmgData80.mat','FDE_EmgData80')