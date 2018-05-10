function otherCompareResults(feature1, feature2)

feature11 = feature1(1,1:5);
feature12 = feature1(2,1:5);
feature13 = feature1(3,1:5);
feature14 = feature1(4,1:5);
feature21 = feature2(1,1:5);
feature22 = feature2(2,1:5);
feature23 = feature2(3,1:5);
feature24 = feature2(4,1:5);

[p,~,stats] = friedman([feature11' feature12' feature13' feature14' feature21' feature22' feature23' feature24']);

results = multcompare(stats,'CType','bonferroni');