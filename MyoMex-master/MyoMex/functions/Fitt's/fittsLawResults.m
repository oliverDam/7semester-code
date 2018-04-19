function [CR,ID,OS,PE,SD,TP] = fittsLawResults(gotIt, targetSet, overshoot, outputValue, startValue, stopValue, timeDif)

CR = completionRate(gotIt,targetSet);
ID = indexOfDifficulty(targetSet);
OS = overshot(overshoot,targetSet);
PE = pathEfficiency(outputValue,targetSet);
SD = stoppingDistance(startValue,stopValue,outputValue);
TP = throughput(timeDif,targetSet);

