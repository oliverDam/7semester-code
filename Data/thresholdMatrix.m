%% Meant to create a threshold matrix for all the different movements?

function [output] = thresholdMatrix(emgData1, emgData2, emgData3, emgData4, ... 
    emgData5, emgData6, emgData7, emgData8)

for i=1:8
    threshold1(i) = rms(emgData1(:,[i]))*0.5;
end
    
for i=1:8
    threshold2(i) = rms(emgData2(:,[i]))*0.5;
end

for i=1:8
    threshold3(i) = rms(emgData3(:,[i]))*0.5;
end

for i=1:8
    threshold4(i) = rms(emgData4(:,[i]))*0.5;
end

for i=1:8
    threshold5(i) = rms(emgData5(:,[i]))*0.5;
end

for i=1:8
    threshold6(i) = rms(emgData6(:,[i]))*0.5;
end

for i=1:8
    threshold7(i) = rms(emgData7(:,[i]))*0.5;
end

for i=1:8
    threshold8(i) = rms(emgData8(:,[i]))*0.5;
end

thresholds{1} = threshold1;
thresholds{2} = threshold2;
thresholds{3} = threshold3;
thresholds{4} = threshold4;
thresholds{5} = threshold5;
thresholds{6} = threshold6;
thresholds{7} = threshold7;
thresholds{8} = threshold8;

output = thresholds;