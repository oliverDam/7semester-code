function goScatterPlot(feature1,feature2,feature3,feature4)

bigMatrix = [feature1;feature2;feature3;feature4];
Ex = ones(270,1)*0;
Fl = ones(270,1)*1;
Ra = ones(270,1)*2;
Ul = ones(270,1)*3;

overallMovement = [Ex;Fl;Ra;Ul];

[pcs, scrs, ~, ~, pexp] = pca(bigMatrix);

figure(1)
%Intensity of principal components
subplot(1,3,1)
pareto(pexp);
xlabel('a)')
title('PCA of the MAV feature of the four movements')
subplot(1,3,[2 3])
%Scatterplot of the four movements
scatter3(scrs(1:270, 1 ), scrs(1:270, 2 ), scrs(1:270, 3 ), 10, overallMovement(1:270,1),'filled')
hold on
scatter3(scrs(271:540, 1 ), scrs(271:540, 2 ), scrs(271:540, 3 ), 10, overallMovement(271:540,1),'filled')
scatter3(scrs(541:810, 1 ), scrs(541:810, 2 ), scrs(541:810, 3 ), 10, overallMovement(541:810,1),'filled')
scatter3(scrs(811:1080, 1 ), scrs(811:1080, 2 ), scrs(811:1080, 3 ), 10, overallMovement(811:1080,1),'filled')
legend('Extension','Flexion','Radial deviation','Ulnar deviation')
xlabel('a)')
title('Scatter plot of the PCA')