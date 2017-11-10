function whatIsAnRegression(emgData, accelData, movement)

%Makes it into something table-ish:
channel_1 = emgData(:,1);
channel_2 = emgData(:,2);
channel_3 = emgData(:,3);
channel_4 = emgData(:,4);
channel_5 = emgData(:,5);
channel_6 = emgData(:,6);
channel_7 = emgData(:,7);
channel_8 = emgData(:,8);

accel_x = accelData(:,1);
accel_y = accelData(:,2);
accel_z = accelData(:,3);

% We have to implemet something that tells the regressor which movements
% we're performing at a given time. I'm not going to do that.

%Creation of dataset for regression-stuff:
cereal = dataset(movement, channel_1, channel_2, channel_3, channel_4, ... 
    channel_5, channel_6, channel_7, channel_8, accel_x, accel_y, accel_z);

Variables = {'movement','emg_1','emg_2','emg_3','emg_4','emg_5','emg_6','emg_7', ...
    'emg_8','acc_x','acc_y','acc_z'};

cereal.Properties.VarDescription = Variables(1,:);

%This gets us our table thing for the data:
regressionInput = dataset2table(cereal);

%Now we start doing some regression-related stuff again:
%regressionInput.movement = categorical(regressionInput.movement,1:4,...
%    {'extension','flexion','radial deviation','ulnar deviation'})

modelspec = 'movement ~ channel_1 + channel_2 + channel_3 + channel_4  + channel_5 + channel_6 + channel_7 + channel_8 + accel_x + accel_y + accel_z';
mdl = fitlm(regressionInput, modelspec)

plotResiduals(mdl)