function [CR1,OS1,PE1,SD1,TP1] = plotGroup1()

CR1 = [];
OS1 = [];
PE1 = [];
SD1 = [];
TP1 = [];
group = 1;

[CR,~,OS,PE,SD,TP] = genTestMatrix('Agnete',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Christian U',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Mads',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Martin AG',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Oliver TD',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

figure;
subplot(2,3,1);
plot(mean(CR1,2),'-o')
title('Completion Rate - Group 1')

subplot(2,3,2);
plot(mean(OS1,2),'-o');
title('Overshoot - Group 1')

subplot(2,3,3);
plot(mean(PE1,2),'-o');
title('Path Efficiency - Group 1')

subplot(2,3,4);
plot(mean(SD1,2),'-o');
title('Stopping Distance - Group 1')

subplot(2,3,5);
plot(mean(TP,2),'-o');
title('Throughput - Group 1');
