function [meanoutput] = featureExtractioMeanAccel(accelData);

for i=1:3
    Column{i} = transpose(accelData(:,[i])); 
end

c1 = buffer(Column{1},40,20)
for j = 1:length(c1(1,:))
    temp = mean(c1(:,j))
    meabs1(j) = temp
end 

c2 = buffer(Column{2},40,20);
for k = 1:length(c2(1,:))
    temp1 = mean(c2(:,k));
    meabs2(k) = temp1;
end 

c3 = buffer(Column{3},40,20);
for l = 1:length(c3(1,:))
    temp2 = mean(c3(:,l));
    meabs3(l) = temp2;
end 

allChan = [meabs1' meabs2' meabs3'];


meanoutput = allChan;