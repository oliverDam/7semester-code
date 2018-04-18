function [output] = stoppingDistance(startValue,stopValue,outputValue)

for i=1:length(startValue)
    distVec = [outputValue(startValue(i):stopValue(i),:)];
    distTravel(i) = findLength(distVec);
end

output = distTravel;