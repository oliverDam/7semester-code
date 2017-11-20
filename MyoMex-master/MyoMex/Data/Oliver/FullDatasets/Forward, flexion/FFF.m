
load('FF_EmgData30.mat')

FFF_EmgData30 = featureExtractionMovVar(FF_EmgData30(801:1400,:));

save('FFF_EmgData30.mat','FFF_EmgData30')

load('FF_EmgData50.mat')

FFF_EmgData50 = featureExtractionMovVar(FF_EmgData50(801:1400,:));

save('FFF_EmgData50.mat','FFF_EmgData50')

load('FF_EmgData80.mat')

FFF_EmgData80 = featureExtractionMovVar(FF_EmgData80(801:1400,:));

save('FFF_EmgData80.mat','FFF_EmgData80')