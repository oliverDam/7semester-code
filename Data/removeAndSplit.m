%% Remove nAn and split into channels:

function [output] = removeAndSplit(emgData)

emgData1 = emgData(:,[1]);
emgData2 = emgData(:,[2]);
emgData3 = emgData(:,[3]);
emgData4 = emgData(:,[4]);
emgData5 = emgData(:,[5]);
emgData6 = emgData(:,[6]);
emgData7 = emgData(:,[7]);
emgData8 = emgData(:,[8]);

emgData1(isnan(emgData1)) = [];
emgData2(isnan(emgData2)) = [];
emgData3(isnan(emgData3)) = [];
emgData4(isnan(emgData4)) = [];
emgData5(isnan(emgData5)) = [];
emgData6(isnan(emgData6)) = [];
emgData7(isnan(emgData7)) = [];
emgData8(isnan(emgData8)) = [];

emgData1 = transpose(emgData1);
emgData2 = transpose(emgData2);
emgData3 = transpose(emgData3);
emgData4 = transpose(emgData4);
emgData5 = transpose(emgData5);
emgData6 = transpose(emgData6);
emgData7 = transpose(emgData7);
emgData8 = transpose(emgData8);

assignin('base','emgData1',emgData1);
assignin('base','emgData2',emgData2);
assignin('base','emgData3',emgData3);
assignin('base','emgData4',emgData4);
assignin('base','emgData5',emgData5);
assignin('base','emgData6',emgData6);
assignin('base','emgData7',emgData7);
assignin('base','emgData8',emgData8);

output = [emgData1; emgData2; emgData3; emgData4; emgData5; emgData6; ...
    emgData7; emgData8];

end