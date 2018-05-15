

function [] = getAnswers()

doPlot = 1;
doCompare = 0;

[CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,trainResult1,trainResult2] = plotGroup(0);

[~] = improvementBetweenSessions(CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,doPlot);

[distance1, distance2, distToCent1, distToCent2] = findDistance;

if doCompare == 1
    [pTestCR,pTCRO] = compareStartToEnd(CR1);
    [pContCR,pCCRO] = compareStartToEnd(CR2);
    [pTestOS,pTOSO] = compareStartToEnd(OS1);
    [pContOS,pCOSO] = compareStartToEnd(OS2);
    [pTestPE,pTPEO] = compareStartToEnd(PE1);
    [pContPE,pCPEO] = compareStartToEnd(PE2);
    [pTestSD,pTSDO] = compareStartToEnd(SD1);
    [pContSD,pCSDO] = compareStartToEnd(SD2);
    [pTestTP,pTTPO] = compareStartToEnd(TP1);
    [pContTP,pCTPO] = compareStartToEnd(TP2);
    
    pPairCR = comparePairwise(CR1,CR2);
    pPairOS = comparePairwise(OS1,OS2);
    pPairPE = comparePairwise(PE1,PE2);
    pPairSD = comparePairwise(SD1,SD2);
    pPairTP = comparePairwise(TP1,TP2);
    
    TR1 = setupTrainResult(trainResult1,1);
    TR2 = setupTrainResult(trainResult2,1);
    
    [pTestTrain,pTTO] = compareStartToEnd(TR1);
    [pContTrain,pCTO] = compareStartToEnd(TR2);
    
    pPairTrain = comparePairwise(TR1,TR2);
    
    TR1 = setupTrainResult(trainResult1,0);
    TR2 = setupTrainResult(trainResult2,0);
    
    [pTestTrainInt,pTTI] = compareStartToEnd(TR1);
    [pContTrainInt,pCTI] = compareStartToEnd(TR2);
    
    pPairTrainInt = comparePairwise(TR1,TR2);
    
    TR1 = setupTrainResult(trainResult1,2);
    TR2 = setupTrainResult(trainResult2,2);
    
    [pTestTrainPos,pTTP] = compareStartToEnd(TR1);
    [pContTrainPos,pTTP] = compareStartToEnd(TR2);
    
    pPairTrainPos = comparePairwise(TR1,TR2);
    
    [pTestDist,pTD] = compareStartToEnd(distance1);
    [pContDist,pCD] = compareStartToEnd(distance2);
    
    pPairDistance = comparePairwise(distance1,distance2);
    
    [pTestDistWithin,pTDW] = compareStartToEnd(distToCent1);
    [pContDistWithin,pCDW] = compareStartToEnd(distToCent2);
    
    pPairDistWithin = comparePairwise(distToCent1,distToCent2);
    
end