%%Input is the full EMG matrix for all the recordings of the movement and
%%then you need the corresponding MVC for the movement in the EMG.

function [output] = optimalMovement()

movement(1:1800,1) = 0.3*ones(1800,1);
movement(1801:3600,1) = 0.5*ones(1800,1);
movement(3601:5400,1) = 0.8*ones(1800,1);

%Creates zeros for the rest of the movements performed
movement(5401:21600,1) = 0*ones(16200,1);

output = movement;