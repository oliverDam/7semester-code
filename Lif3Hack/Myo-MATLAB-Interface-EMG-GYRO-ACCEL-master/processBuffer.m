function [output] = processBuffer(buffer)

%% Removes nAn if present
for i=1:8
    column = buffer(:,[i]);
    column(isnan(column)) = [];
    nAnbuffer{i} = transpose(column);
end

nAnbuffer = [nAnbuffer{1}; nAnbuffer{2}; nAnbuffer{3}; nAnbuffer{4}; ...
    nAnbuffer{5}; nAnbuffer{6}; nAnbuffer{7}; nAnbuffer{8}];

%% Does the butt filter

[b,a] = butter(2,0.05,'high');

for i=1:8
    filterEmg{i} = filtfilt(b,a,nAnbuffer([i],:));
end

%% Finds absolute value of the data:
buffer = abs([filterEmg{1}; filterEmg{2}; filterEmg{3}; filterEmg{4}; ...
    filterEmg{5}; filterEmg{6}; filterEmg{7}; filterEmg{8}])

%% Smoothens the data to avoid a "jumpy" dot
smoothData = smooth(buffer, 0.1, 'rloess');

%% Add min and max value for contraction to the matrix
% This should be changed to the max for the processing to work
%rowmin = min(maxContractionMeasurement,[],2);
%rowmax = max(maxContractionMeasurement,[],2);

% Scale data between 0 and 1 with the previously stated min and max values:
%normData = rescale(buffer, 'InputMin', rowmin, 'InputMax', rowmax);

%% Mean of the channels (should be made into rescale relative to the 
%  maximum contraction i think?):

%These numbers are just random but they seem to work for me.. We might
%have to make them adjustable instead of based on previous measurements
normData = rescale(mean(smoothData), 'InputMin', 1, 'InputMax', 50);

output = normData;

%output = mean(smoothData);
