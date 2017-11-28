function [output] = whatIsAnRidgeRegression(rightEmgData, wrongEmgData1, wrongEmgData2, wrongEmgData3, movement)

%Take ALL the data as inputs and such and fuck it and it works #yolo
%Movement is the percent value between 0 and 1 for the movement?

L = length(rightEmgData(:,1));

inputData(1:L,1:8) = rightEmgData;

inputData(L+1:2*L,1:8) = wrongEmgData1;
inputData(2*L+1:3*L,1:8) = wrongEmgData2;
inputData(3*L+1:4*L,1:8) = wrongEmgData3;

%Makes it into something table-ish:
channel_1 = inputData(:,1);
channel_2 = inputData(:,2);
channel_3 = inputData(:,3);
channel_4 = inputData(:,4);
channel_5 = inputData(:,5);
channel_6 = inputData(:,6);
channel_7 = inputData(:,7);
channel_8 = inputData(:,8);

%accel_x = accelData(:,1);
%accel_y = accelData(:,2);
%accel_z = accelData(:,3);

inputData = inputData';
lolmdl = fitrlinear(inputData,movement,'ObservationsIn','columns','KFold',5,'Lambda',[0.1:0.1:1], ...
    'Learner','leastsquares','Regularization','ridge')
mdl = lolmdl.Trained{1};

idxFinal = 5;
mdl = selectModels(mdl,idxFinal)

%use predict to find outputs.

output = mdl;