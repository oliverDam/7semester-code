load('AccelData.mat')
load('EmgData.mat')
SU_Test50 = accelMatrix;
SU_TestA50 = EmgMatrix;
save('SU_Test50.mat','SU_Test50');
save('SU_TestA50.mat','SU_TestA50');

load('MVC.mat')
SU_MVC = MVC;
save('SU_MVC.mat','SU_MVC')