load('AccelData.mat')
load('EmgData.mat')
FR_AccelData80 = accelMatrix;
FR_EmgData80 = EmgMatrix;
save('FR_AccelData80.mat','FR_AccelData80');
save('FR_EmgData80.mat','FR_EmgData80');

load('MVC.mat')
FR_MVC = MVC;
save('FR_MVC.mat','FR_MVC')