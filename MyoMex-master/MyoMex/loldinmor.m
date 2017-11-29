load('AccelData.mat')
load('EmgData.mat')
FU_Test50 = accelMatrix;
FU_TestA50 = EmgMatrix;
save('FU_Test50.mat','FU_Test50');
save('FU_TestA50.mat','FU_TestA50');