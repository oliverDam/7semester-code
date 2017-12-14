load('AccelData.mat')
load('EmgData.mat')
SU_AccelData80 = accelMatrix;
SU_EmgData80 = EmgMatrix;
save('SU_AccelData80.mat','SU_AccelData80');
save('SU_EmgData80.mat','SU_EmgData80');

load('MVC.mat')
SU_MVC = MVC;
save('SU_MVC.mat','SU_MVC')