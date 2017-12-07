v = buffer(DE_EmgData80(:,6),20);
l = length(v(1,:));
for i = 1:l
    temp = mean(abs(v(:,i)));
    v_mav(i) = temp;
end 

for j = 1:l
    temp1 = log(var(v(:,j)));
    v_lv(j) = temp1;
end 

tid = [1:length(DE_EmgData80(:,6))]/200;
tid2 = [1:length(v_mav)]/10;

figure(1)
subplot(3,1,1)
plot(tid,DE_EmgData80(:,6))
legend('Raw EMG signal')
ylabel('EMG intensity')
xlim([0 10])
title('Illustration of raw EMG and two features')
subplot(3,1,2)
plot(tid2,v_mav)
ylabel('Feature intensity')
legend('Mean absolut value')
xlim([0 10])
subplot(3,1,3)
plot(tid2,v_lv)
legend('Logarithmic variance')
xlim([0 10])
ylabel('Feature intensity')
xlabel('Time in seconds')