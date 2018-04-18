function [output] = createTargetset(targetSet)

%What targetset did the 
if targetSet == 1
    randomOrder = (1:16);
elseif targetSet == 2
    randomOrder = [1,4,3,5,6,8,2,9,7,16,10,12,13,11,15,14];
elseif targetSet == 3
	randomOrder = [4,5,1,7,6,3,10,14,13,16,8,11,2,15,12,9];
elseif targetSet == 4
	randomOrder = [6,11,16,1,4,15,13,5,2,12,14,7,3,8,10,9];
end
        
plotData = ...
	2*[3,0,2,-1,-4,2,-5,1,6,-2,0,4,-4,-6,1,7 ...
	;1,4,-3,4,0,-4,-6,2,5,-3,0,-4,2,7,1,4];
SizeOfDot = 35*[1 0.5 0.4 0.9 1.2 1.4 0.7 1.3 1 1.6 0.9 0.4 0.8 1.3 1.1 1.5];

targets = [];

for i=1:length(randomOrder)
    targets = [targets; plotData(:,randomOrder(i))', SizeOfDot(randomOrder(i))];
end

output = targets;