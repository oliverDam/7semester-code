%%Input is the full EMG matrix for all the recordings of the movement and
%%then you need the corresponding MVC for the movement in the EMG.

function [output] = CreateMovement(emgData, MVC);

%Finds the MVC of the entire band
maximum = mean(MVC);

%Finds the mean of every row in the emg data
emgData = mean(abs(emgData),2);

%Rescales between 0 and 1 based on the MVC
movement = rescale(emgData,'InputMin',0,'InputMax',maximum);

%Creates zeros for the rest of the movements performed
movement(5401:21600,1) = 0*ones(16200,1);

output = movement;