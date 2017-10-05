%% Remove nAn and splits stuff to make it work

function [output] = removeAndSplit(emgData)

for i=1:8
    pancake = emgData(:,[i]);
    pancake(isnan(pancake)) = [];
    cakepan{i} = transpose(pancake);
end

output = [cakepan{1}; cakepan{2}; cakepan{3}; cakepan{4}; cakepan{5}; ...
    cakepan{6}; cakepan{7}; cakepan{8}];

end