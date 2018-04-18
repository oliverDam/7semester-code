function [output] = indexOfDifficulty(targetSet)

targets = createTargetset(targetSet);
targets = [0 0 10; targets];
ID = [];
distanceBetween = [];
sizeBetween = [];

for i=1:length(targets)-1
    distanceBetween = [distanceBetween; sum(abs(targets(i,1:2)-targets(i+1,1:2)))];
    sizeBetween = [sizeBetween; abs(targets(i,3)-targets(i+1,3))];
    ID = [ID; log2(distanceBetween(i)/sizeBetween(i)+1)];
end

output = ID;