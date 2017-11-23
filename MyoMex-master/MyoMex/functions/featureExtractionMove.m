function [Moveoutput] = featureExtractionMove(emgData, MVC);

MVC = mean(MVC,2);
meanRows = mean(emgData,2);
allChan = rescale(meanRows(:,1),'InputMin',0,'InputMax',MVC);

Moveoutput = allChan;