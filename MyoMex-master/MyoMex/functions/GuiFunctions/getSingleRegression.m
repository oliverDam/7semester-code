function [output] = getSingleRegression(featureData,ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression,FistRegression,StretchRegression,classValue)

flex = featureData(:,1:8);

[~, class] = find(ismember(classValue, max(classValue(:))));

if class == 1
    predValue = [mean(feval(ExtensionRegression,flex)),0,0];
elseif class == 2
    predValue = [-mean(feval(FlexionRegression,flex)),0,0];
elseif class == 3
    predValue = [0,mean(feval(RadialRegression,flex)),0];
elseif class == 4
    predValue = [0,-mean(feval(UlnarRegression,flex)),0];
elseif class == 5
    predValue = [0,0,-mean(feval(FistRegression,flex))];
elseif class == 6
    predValue = [0,0,mean(feval(StretchRegression,flex))];
elseif class == 7
    predValue = [0,0,0];
end

output = predValue;