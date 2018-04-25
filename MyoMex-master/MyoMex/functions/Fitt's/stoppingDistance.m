function [output] = stoppingDistance(startValue,stopValue,outputValue)

for i=1:length(startValue)
    if stopValue(i+1) == 0
        distTravel(i) = nan;
    else
        distVec = [outputValue(startValue(i):stopValue(i+1),:)];
        distTravel(i) = findLength(distVec);
    end
end

distTravel(isnan(distTravel)) = [];

output = distTravel;