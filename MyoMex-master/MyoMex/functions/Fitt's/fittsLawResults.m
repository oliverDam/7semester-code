function [CR,ID,OS,PE,SD,TP] = fittsLawResults(targetSet)

load('gotIt.mat');
load('overshots.mat');
load('outputValue.mat');
load('startValue.mat');
load('stopValue.mat');
load('timeDif.mat');

CR = completionRate(gotIt,targetSet);
ID = indexOfDifficulty(targetSet);
OS = overshot(overshots,gotIt);%targetSet);
PE = pathEfficiency(outputValue,targetSet);
SD = stoppingDistance(startValue,stopValue,outputValue);
TP = throughput(timeDif,targetSet);