function output = removeBaseline(inputData, baseline)

%Tried to remove the baseline:

for i=1:8
    if abs(baseline(i)) >= abs(inputData(i))
        outputData(i) = inputData(i)/5;
    else
        outputData(i) = inputData(i);
    end
end

[output] = outputData;
        