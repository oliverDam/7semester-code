function goScatterPlot(feature1,feature2,feature3,feature4)

bigMatrix = [feature1;feature2;feature3;feature4];
Ex = ones(270,1)*0;
Fl = ones(270,1)*1;
Ra = ones(270,1)*2;
Ul = ones(270,1)*3;

overallMovement = [Ex;Fl;Ra;Ul];

[pcs, scrs, ~, ~, pexp] = pca(bigMatrix);

pareto(pexp);

scatter3(scrs( :, 1 ), scrs( :, 2 ), scrs( :, 3 ), 10, overallMovement)