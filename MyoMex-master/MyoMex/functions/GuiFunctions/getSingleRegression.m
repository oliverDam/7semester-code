function [output] = getSingleRegression(featureData,ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression,classValue)

flex = featureData(:,1:8);

[~, class] = find(ismember(classValue, max(classValue(:))));

if class == 1
    predValue = [mean(feval(ExtensionRegression,flex)),0];
elseif class == 2
    predValue = [-mean(feval(FlexionRegression,flex)),0];
elseif class == 3
    predValue = [0,mean(feval(RadialRegression,flex))];
elseif class == 4
    predValue = [0,-mean(feval(UlnarRegression,flex))];
elseif class == 5
    predValue = [0,0];
end

output = predValue;