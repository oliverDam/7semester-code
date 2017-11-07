function [output] = butterFilter(inputData)

inputData = inputData;

[b,a] = butter(2,0.05,'high');

for i=1:8
    filterEmg{i} = filtfilt(b,a,transpose(inputData(:,[i])));
    filterEmg{i} = transpose(filterEmg{i});
end

buffer = [filterEmg{1} filterEmg{2} filterEmg{3} filterEmg{4} ...
    filterEmg{5} filterEmg{6} filterEmg{7} filterEmg{8}];

output = buffer;