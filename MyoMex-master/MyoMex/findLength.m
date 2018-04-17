function [output] = findLength(outputValue)

%Takes the absolute value for the traveled length to make sense:
absVal = abs(outputValue);
L = length(absVal(:,1));

for i=1:L-1
    temp(i,:) = absVal(i,:)-absVal(i+1,:);
end

%Finds the total value traveled in X, Y and Z direction:
temp = sum(sum(abs(temp)));
output = temp;