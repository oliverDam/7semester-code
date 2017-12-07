function [output] = getRegressionValueIMUTest(featureData,imu,mahExtensionRegrizzle,mahFlexionRegrizzle,mahRadialRegrizzle,mahUlnarRegrizzle)

L = length(featureData(:,1));

flex1 = featureData(:,1);
flex2 = featureData(:,2);
flex3 = featureData(:,3);
flex4 = featureData(:,4);
flex5 = featureData(:,5);
flex6 = featureData(:,6);
flex7 = featureData(:,7);
flex8 = featureData(:,8);
imu1 = imu(1:L,1);
imu2 = imu(1:L,2);
imu3 = imu(1:L,3);

ypredExte = feval(mahExtensionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8,imu1,imu2,imu3);
ypredFlex = feval(mahFlexionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8,imu1,imu2,imu3);
ypredRadi = feval(mahRadialRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8,imu1,imu2,imu3);
ypredUlna = feval(mahUlnarRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8,imu1,imu2,imu3);

figure;
plot(smooth(ypredExte))
hold on;
plot(smooth(ypredFlex))
plot(smooth(ypredRadi))
plot(smooth(ypredUlna))
legend('Extension','Flexion','Radial','Ulnar');

output = [ypredFlex, ypredExte, ypredRadi, ypredUlna];