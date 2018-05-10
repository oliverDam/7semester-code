function [output] = indexOfDifficulty(targetSet)

targets = createTargetset(targetSet);
ID = [];
distanceBetween = [];
sizeBetween = [];
startSize = [90 90 90 90 30 30 30 30 90 90 90 90 30 30 30 30];
targets(:,3) = targets(:,3)*60;

for i=1:length(targets)
    distanceBetween = [distanceBetween; sum(abs([0 0 startSize(i)/2]-[targets(i,1:2),targets(i,3)/2]))];
    sizeBetween = [sizeBetween; abs(startSize(i)-targets(i,3))];
    ID = [ID; log2(distanceBetween(i)/(1/3)+1)];
end

output = ID;