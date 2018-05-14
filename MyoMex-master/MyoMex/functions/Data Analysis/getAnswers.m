

function [] = getAnswers()

doPlot = 0;
doCompare = 1;

[CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,trainResult1,trainResult2] = plotGroup(doPlot);

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
    
    [pTestTrain,pTTO] = compareStartToEnd(setupTrainResult(trainResult1));
    [pContTrain,pCTO] = compareStartToEnd(setupTrainResult(trainResult2));
    
    pPairTrain = comparePairwise(setupTrainResult(trainResult1),... 
        setupTrainResult(trainResult2));
    
    
end