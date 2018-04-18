function [output] = pathEfficiency(outputValue,targetSet)

targets = createTargetset(targetSet);

optimalPath = findLength(targets);
pathTaken = findLength(outputValue);

output = optimalPath/pathTaken;