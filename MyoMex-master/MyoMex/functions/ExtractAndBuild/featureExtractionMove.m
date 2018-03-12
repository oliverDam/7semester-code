function [Moveoutput] = featureExtractionMove(emgData, MVC);

LD = length(emgData);
MVC = mean(MVC,2);
meanRows = mean(emgData,2);
allChan = rescale(meanRows(:,1),'InputMin',0,'InputMax',MVC);
allChan(LD+1:4*LD,1) = 0*ones(3*LD,1);

Moveoutput = allChan;