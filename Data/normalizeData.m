function [output] = normalizeData(emgData)

for i=1:8
    column = emgData([i],:);
    columnMatrix{i} = (column - min(column)) / (max(column) - min(column));
end

output = [columnMatrix{1}; columnMatrix{2}; columnMatrix{3}; columnMatrix{4}; columnMatrix{5}; ...
    columnMatrix{6}; columnMatrix{7}; columnMatrix{8}];
