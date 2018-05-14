function [pp,p] = compareStartToEnd(feature)

[pp,~,stats] = friedman(feature');

results = multcompare(stats,'CType','hsd');

p = results(:,end);