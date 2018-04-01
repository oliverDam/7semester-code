% This function retreives the classification values based on the input
% classifier and the feature data.

function [output] = getClassificationValue(featureData,MdlLinear)

[class scores] = predict(MdlLinear, featureData);

ypredExte = mean(scores(:,1));
ypredFlex = mean(scores(:,2));
ypredRadi = mean(scores(:,3));

%This is due to the alphabetical sorting of the scores, which means that
%ulnar comes after rest in the output scores. Silly stuff, MATLAB...
ypredUlna = mean(scores(:,5));
ypredRest = mean(scores(:,4));

output = [ypredExte, ypredFlex, ypredRadi, ypredUlna, ypredRest];