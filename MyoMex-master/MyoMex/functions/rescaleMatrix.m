function output = rescaleMatrix(inputData, MVC)

%This rescales the input matrix between 0 and our MVC vector:
for i=1:8
    maxColumn{i} = rescale(transpose(inputData(:,[i])),'InputMin', 0, 'InputMax', MVC(i));
    maxColumn{i} = transpose(maxColumn{i});
end

%Creates the output matrix
buffer = [maxColumn{1} maxColumn{2} maxColumn{3} maxColumn{4} ...
    maxColumn{5} maxColumn{6} maxColumn{7} maxColumn{8}];

output = buffer;