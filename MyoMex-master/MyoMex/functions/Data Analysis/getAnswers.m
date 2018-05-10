

function [] = getAnswers()

[CR1,OS1,PE1,SD1,TP1] = plotGroup1;
[CR2,OS2,PE2,SD2,TP2] = plotGroup2;

otherCompareResults(CR1,CR2);
otherCompareResults(OS1,OS2);
otherCompareResults(PE1,PE2);
otherCompareResults(SD1,SD2);
otherCompareResults(TP1,TP2);

% 
% resultsCR1 = compareResults(CR1, CR2, 1);
% resultsCR2 = compareResults(CR1, CR2, 2);
% resultsCR3 = compareResults(CR1, CR2, 3);
% resultsCR4 = compareResults(CR1, CR2, 4);
% 
% resultsOS1 = compareResults(OS1, OS2, 1);
% resultsOS2 = compareResults(OS1, OS2, 2);
% resultsOS3 = compareResults(OS1, OS2, 3);
% resultsOS4 = compareResults(OS1, OS2, 4);
% 
% resultsPE1 = compareResults(PE1, PE2, 1);
% resultsPE2 = compareResults(PE1, PE2, 2);
% resultsPE3 = compareResults(PE1, PE2, 3);
% resultsPE4 = compareResults(PE1, PE2, 4);
% 
% resultsSD1 = compareResults(SD1, SD2, 1);
% resultsSD2 = compareResults(SD1, SD2, 2);
% resultsSD3 = compareResults(SD1, SD2, 3);
% resultsSD4 = compareResults(SD1, SD2, 4);
% 
% resultsTP1 = compareResults(TP1, TP2, 1);
% resultsTP2 = compareResults(TP1, TP2, 2);
% resultsTP3 = compareResults(TP1, TP2, 3);
% resultsTP4 = compareResults(TP1, TP2, 4);