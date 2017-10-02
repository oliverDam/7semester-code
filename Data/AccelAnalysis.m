function AccelAnalysis(accelData)

%Splits into different columns and removes nAn

accelData1 = accelData(:,[1]);
accelData2 = accelData(:,[2]);
accelData3 = accelData(:,[3]);

accelData1(isnan(accelData1)) = [];
accelData2(isnan(accelData2)) = [];
accelData3(isnan(accelData3)) = [];

accelData1 = transpose(accelData1);
accelData2 = transpose(accelData2);
accelData3 = transpose(accelData3);

%% Plotting the x, y and z axis of the gyroscope

figure;
hold on;
plot(accelData1,'m');
plot(accelData2,'g');
plot(accelData3,'b');
hold off;