function [CR1,OS1,PE1,SD1,TP1] = plotGroup2()

CR1 = [];
OS1 = [];
PE1 = [];
SD1 = [];
TP1 = [];
group = 2;

[CR,~,OS,PE,SD,TP] = genTestMatrix('Ardalan',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Christian KM',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Ignas',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Jakob',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Martin S',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Svidt',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP] = genTestMatrix('Toby W',group);
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

figure;
subplot(2,3,1);
plot(mean(CR1,2),'-o')
title('Completion Rate - Group 2')

subplot(2,3,2);
plot(mean(OS1,2),'-o');
title('Overshoot - Group 2')

subplot(2,3,3);
plot(mean(PE1,2),'-o');
title('Path Efficiency - Group 2')

subplot(2,3,4);
plot(mean(SD1,2),'-o');
title('Stopping Distance - Group 2')

subplot(2,3,5);
plot(mean(TP,2),'-o');
title('Throughput - Group 2');
