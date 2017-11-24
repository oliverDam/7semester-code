load('AccelData.mat')
load('EmgData.mat')
SE_AccelData30 = accelMatrix;
SE_EmgData30 = EmgMatrix;
save('SE_EmgData30.mat','SE_EmgData30');
save('SE_AccelData30.mat','SE_AccelData30');
load('AccelData.mat')
load('EmgData.mat')
SE_AccelData50 = accelMatrix;
SE_EmgData50 = EmgMatrix;
save('SE_EmgData50.mat','SE_EmgData50');
save('SE_AccelData50.mat','SE_AccelData50');
load('AccelData.mat')
load('EmgData.mat')
SE_AccelData80 = accelMatrix;
SE_EmgData80 = EmgMatrix;
save('SE_EmgData80.mat','SE_EmgData80');
save('SE_AccelData80.mat','SE_AccelData80');

load('MVC.mat')
SE_MVC = MVC;
save('SE_MVC.mat','SE_MVC')