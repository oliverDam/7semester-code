function [output] = getClassificationValue(featureData,MdlLinear)

[class scores] = predict(MdlLinear, featureData);

ypredFlex = mean(scores(:,1));
ypredExte = mean(scores(:,2));
ypredRadi = mean(scores(:,3));
ypredUlna = mean(scores(:,4));

if ypredExte >= ypredFlex
    xValue = ypredExte;
else
    xValue = 0-ypredFlex;
end

if ypredRadi >= ypredUlna
    yValue = ypredRadi;
else
    yValue = 0-ypredUlna;
end

output = [xValue, yValue];