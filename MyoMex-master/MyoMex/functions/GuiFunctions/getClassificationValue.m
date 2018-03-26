% This function retreives the classification values based on the input
% classifier and the feature data.

function [output] = getClassificationValue(featureData,MdlLinear)

[class scores] = predict(MdlLinear, featureData);

ypredExte = mean(scores(:,1));
ypredFlex = mean(scores(:,2));
ypredRadi = mean(scores(:,3));
ypredUlna = mean(scores(:,4));
ypredRest = mean(scores(:,5));

output = [ypredExte, ypredFlex, ypredRadi, ypredUlna, ypredRest];