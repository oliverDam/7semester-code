function [Moveoutput] = featureExtractionMove(emgData);

for i=1:8
    Column{i} = transpose(emgData(:,[i])); 
end

c1 = buffer(Column{1},40,20)
for j = 1:length(c1(1,:))
    temp = log(var(c1(:,j)))
    movement1(j) = temp
end 

c2 = buffer(Column{2},40,20);
for k = 1:length(c2(1,:))
    temp1 = log(var(c2(:,k)));
    movement2(k) = temp1;
end 

c3 = buffer(Column{3},40,20);
for l = 1:length(c3(1,:))
    temp2 = log(var(c3(:,l)));
    movement3(l) = temp2;
end 

c4 = buffer(Column{4},40,20);
for m = 1:length(c4(1,:))
    temp3 = log(var(c4(:,m)));
    movement4(m) = temp3;
end 

c5 = buffer(Column{5},40,20);
for n = 1:length(c5(1,:))
    temp4 = log(var(c5(:,n)));
    movement5(n) = temp4;
end 

c6 = buffer(Column{6},40,20);
for o = 1:length(c6(1,:))
    temp5 = log(var(c6(:,o)));
    movement6(o) = temp5;
end 

c7 = buffer(Column{7},40,20);
for p = 1:length(c7(1,:))
    temp6 = log(var(c7(:,p)));
    movement7(p) = temp6;
end 

c8 = buffer(Column{8},40,20);
for q = 1:length(c8(1,:))
    temp7 = log(var(c8(:,q)));
    movement8(q) = temp7;
end 

allChan = [movement1' movement2' movement3' movement4' movement5' movement6' movement7' movement8'];


Moveoutput = allChan;
