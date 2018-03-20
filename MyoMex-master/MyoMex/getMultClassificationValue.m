% This function retreives the classification values based on the input
% classifier and the feature data.

function [output] = getMultClassificationValue(featureData,MdlLinearExtFle,MdlLinearRadUln)

[class scoresEF] = predict(MdlLinearExtFle, featureData);
[class scoresRU] = predict(MdlLinearRadUln, featureData);

ypredExte = mean(scoresEF(:,1));
ypredFlex = mean(scoresEF(:,2));
ypredRadi = mean(scoresRU(:,1));
ypredUlna = mean(scoresRU(:,2));

temp = [ypredExte, ypredFlex, ypredRadi, ypredUlna];

max = sum(temp);

output = rescale(temp,'InputMin',0,'InputMax',max);