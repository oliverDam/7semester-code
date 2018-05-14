function [CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,trainResult1,trainResult2] = plotGroup(doPlot)

%% Group 1:
CR1 = [];
OS1 = [];
PE1 = [];
SD1 = [];
TP1 = [];
group = 1;
trainResult1 = [];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Agnete',group);
trainResult1 = [trainResult1,dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Aske',group);
trainResult1 = [trainResult1,dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Christian U',group);
trainResult1 = [trainResult1,dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Mads',group); %Måske exclude [1 1 0 1]
trainResult1 = [trainResult1,dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Martin AG',group);
trainResult1 = [trainResult1,dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

% [CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Nick',group); %Måske exclude [0 2 mange]
% trainResult1 = [trainResult1,dingThing];
% CR1 = [CR1, CR];
% OS1 = [OS1, OS];
% PE1 = [PE1, PE];
% SD1 = [SD1, SD];
% TP1 = [TP1, TP];

% [CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Niels',group); %Måske exclude [2 3 3 0]
% trainResult1 = [trainResult1,dingThing];
% CR1 = [CR1, CR];
% OS1 = [OS1, OS];
% PE1 = [PE1, PE];
% SD1 = [SD1, SD];
% TP1 = [TP1, TP];

% [CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Oliver TD',group);
% trainResult1 = [trainResult1,dingThing];
% CR1 = [CR1, CR];
% OS1 = [OS1, OS];
% PE1 = [PE1, PE];
% SD1 = [SD1, SD];
% TP1 = [TP1, TP];


%% Group 2:
CR2 = [];
OS2 = [];
PE2 = [];
SD2 = [];
TP2 = [];
group = 2;
trainResult2 = [];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Ardalan',group);
trainResult2 = [trainResult2,dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Christian KM',group);
trainResult2 = [trainResult2,dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

% [CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Ignas',group); %Måske exclude [1 1 0 4]
% trainResult2 = [trainResult2,dingThing];
% CR2 = [CR2, CR];
% OS2 = [OS2, OS];
% PE2 = [PE2, PE];
% SD2 = [SD2, SD];
% TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Jakob',group);
trainResult2 = [trainResult2,dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

% [CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Mads K',group); %Måske exclude [0 3 mange lidt mindre]
% trainResult2 = [trainResult2,dingThing];
% CR2 = [CR2, CR];
% OS2 = [OS2, OS];
% PE2 = [PE2, PE];
% SD2 = [SD2, SD];
% TP2 = [TP2, TP];

% [CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Martin S',group); %Måske exclude [3 0 4 1]
% trainResult2 = [trainResult2,dingThing];
% CR2 = [CR2, CR];
% OS2 = [OS2, OS];
% PE2 = [PE2, PE];
% SD2 = [SD2, SD];
% TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Svidt',group);
trainResult2 = [trainResult2,dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Toby W',group);
trainResult2 = [trainResult2,dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

if doPlot == 1

    MIN = 1;
    MAX = 4;

    %Plotting stuff
    figure;
    subplot(2,3,1);
    plot(100*mean(CR1,2),'-o','color','r');
    hold on;
    plot(100*mean(CR2,2),'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Completion Rate in %');
    xlabel('Test Number');
    xlim([MIN MAX]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Completion Rate')

    subplot(2,3,2);
    plot(mean(OS1,2),'-o','color','r');
    hold on;
    plot(mean(OS2,2),'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Overshoots');
    xlabel('Test Number');
    xlim([MIN MAX]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Overshoot')

    subplot(2,3,3);
    plot(100*mean(PE1,2),'-o','color','r');
    hold on;
    plot(100*mean(PE2,2),'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Path Efficiency in %');
    xlabel('Test Number');
    xlim([MIN MAX]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Path Efficiency')

    subplot(2,3,4);
    plot(mean(SD1,2),'-o','color','r');
    hold on;
    plot(mean(SD2,2),'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Stopping Distance');
    xlabel('Test Number');
    xlim([MIN MAX]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Stopping Distance')

    subplot(2,3,5);
    plot(mean(TP1,2),'-o','color','r');
    hold on;
    plot(mean(TP2,2),'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Throughput');
    xlabel('Test Number');
    xlim([MIN MAX]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Throughput');
end

temp1 = [];
temp2 = [];
temp3 = [];
temp4 = [];
temp5 = [];
temp6 = [];

for i=1:size(trainResult1,2)
    temp1 = [temp1;trainResult1(1:4,i)];
    temp2 = [temp2;trainResult1(5:8,i)];
    temp3 = [temp3;trainResult1(9:12,i)];
    temp4 = [temp4;trainResult2(1:4,i)];
    temp5 = [temp5;trainResult2(5:8,i)];
    temp6 = [temp6;trainResult2(9:12,i)];
end

trainResult1 = [temp1,temp2,temp3];
trainResult2 = [temp4,temp5,temp6];
