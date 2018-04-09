function [CCoutput] = featureExtractionCC(emgData);

normRaw = [];

for i=1:8
    Column{i} = transpose(emgData(:,[i])) 
end
%Normalize each window for each channel by subtracting the mean from each raw data point and dividing it by its std  

c1 = buffer(Column{1},40,20)
for j = 1:length(c1(1,:));
    for k = 1:length(c1(:,1));
    temp = c1(k,j)-mean(c1(:,j))/std(c1(:,j));
    meabs1(k) = temp;
    end
normRaw = [normRaw,meabs1'];    
end

% c2 = buffer(Column{2},40,20);
% for k = 1:length(c2(1,:))
%     temp = c2(k,1)-mean(c2(:,1))/std(c2(:,1))
%     meabs2(k) = temp; 
% end
% 
% c3 = buffer(Column{3},40,20);
% for l = 1:length(c3(1,:))
%     temp = (c3(:,l)-mean(c3))/std(c3);
%     meabs3(l) = temp; 
% end
% 
% c4 = buffer(Column{4},40,20);
% for m = 1:length(c4(1,:))
%     temp = (c4(:,m)-mean(c4))/std(c4);
%     meabs4(m) = temp; 
% end
% 
% c5 = buffer(Column{5},40,20);
% for n = 1:length(c5(1,:))
%     temp = (c5(:,n)-mean(c5))/std(c5);
%     meabs5(n) = temp; 
% end
% 
% c6 = buffer(Column{6},40,20);
% for o = 1:length(c6(1,:))
%     temp = (c6(:,o)-mean(c6))/std(c6);
%     meabs6(o) = temp; 
% end
% 
% c7 = buffer(Column{7},40,20);
% for p = 1:length(c7(1,:))
%     temp = (c7(:,p)-mean(c7))/std(c7);
%     meabs7(p) = temp; 
% end
% 
% c8 = buffer(Column{8},40,20);
% for q = 1:length(c8(1,:))
%     temp = (c8(:,q)-mean(c8))/std(c8);
%     meabs8(q) = temp; 
% end
% 
% % Calculate CC --> multiplying data points from channel x with the
% % corresponding data points from the neighboring channel. These values are
% % summed and divided by the window length (40 samples). 
% 
% for a = 1:length(meabs1(1,:))
%     temp = meabs1(a)*meabs2(a);
%     twoChan1(a) = temp;
% end 
% CC1 = sum(twoChan1)/length(meabs1(1,:));
% 
% for b = 1:length(meabs2(1,:))
%     temp = meabs2(b)*meabs3(b);
%     twoChan2(b) = temp;
% end
% 
% CC2 = sum(twoChan2)/length(meabs2(1,:));
% 
% for c = 1:length(meabs3(1,:))
%     temp = meabs3(c)*meabs4(c);
%     twoChan3(c) = temp;
% end 
% CC3 = sum(twoChan3)/length(meabs3(1,:));
% 
% for d = 1:length(meabs4(1,:))
%     temp = meabs4(d)*meabs5(d);
%     twoChan4(d) = temp;
% end 
% CC4 = sum(twoChan4)/length(meabs4(1,:));
% 
% for e = 1:length(meabs5(1,:))
%     temp = meabs5(e)*meabs6(e);
%     twoChan5(e) = temp;
% end 
% CC5 = sum(twoChan5)/length(meabs5(1,:));
% 
% for f = 1:length(meabs6(1,:))
%     temp = meabs6(f)*meabs7(f);
%     twoChan6(f) = temp;
% end 
% CC6 = sum(twoChan6)/length(meabs6(1,:));
% 
% for g = 1:length(meabs7(1,:))
%     temp = meabs7(g)*meabs8(g);
%     twoChan7(g) = temp;
% end 
% CC7 = sum(twoChan7)/length(meabs7(1,:));
% 
% for h = 1:length(meabs8(1,:))
%     temp = meabs8(h)*meabs1(h);
%     twoChan8(h) = temp;
% end 
% CC8 = sum(twoChan8)/length(meabs8(1,:));
% 
% 
% allChan = [CC1' CC2' CC3' CC4' CC5' CC6' CC7' CC8']

CCoutput = normRaw;
