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
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Aske',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Christian U',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Mads',group); %Måske exclude [1 1 0 1]
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Martin AG',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Nick',group); %Måske exclude [0 2 mange]
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Niels',group); %Måske exclude [2 3 3 0]
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Oliver TD',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

L = length(CR1);
i = 1;

while i <= L
    for j=1:size(CR1,1)
        if CR1(j,i) == 0 || OS1(j,i) == 100
            OS1(:,i) = [];
            PE1(:,i) = [];
            SD1(:,i) = [];
            TP1(:,i) = [];
            L = L-1;
        end
    end
    i = i+1;
end


%% Group 2:
CR2 = [];
OS2 = [];
PE2 = [];
SD2 = [];
TP2 = [];
group = 2;
trainResult2 = [];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Ardalan',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Christian KM',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Ignas',group); %Måske exclude [1 1 0 4]
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Jakob',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Mads K',group); %Måske exclude [0 3 mange lidt mindre]
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Martin S',group); %Måske exclude [3 0 4 1]
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Svidt',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Toby W',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

L = length(CR2);
i = 1;

while i <= L
    for j=1:size(CR2,1)
        if CR2(j,i) == 0
            OS2(:,i) = [];
            PE2(:,i) = [];
            SD2(:,i) = [];
            TP2(:,i) = [];
            L = L-1;
        end
    end
    i = i+1;
end

if doPlot == 1

    MIN = 1;
    MAX = 4;
    
    err1 = 100*std(CR1');
    err2 = 100*std(CR2');
    %Plotting stuff
    figure;
    errorbar(100*mean(CR1,2),err1,'-o','color','r');
    hold on;
    errorbar(100*mean(CR2,2),err2,'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Completion Rate in %');
    xlabel('Test Number');
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Completion Rate')

    err1 = std(OS1');
    err2 = std(OS2');
    figure;
    errorbar(mean(OS1,2),err1,'-o','color','r');
    hold on;
    errorbar(mean(OS2,2),err2,'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Overshoots');
    xlabel('Test Number');
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Overshoot')

    err1 = 100*std(PE1');
    err2 = 100*std(PE2');
    figure;
    errorbar(100*mean(PE1,2),err1,'-o','color','r');
    hold on;
    errorbar(100*mean(PE2,2),err2,'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Path Efficiency in %');
    xlabel('Test Number');
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Path Efficiency')

    err1 = std(SD1');
    err2 = std(SD2');
    figure;
    errorbar(mean(SD1,2),err1,'-o','color','r');
    hold on;
    errorbar(mean(SD2,2),err2,'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Stopping Distance');
    xlabel('Test Number');
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Stopping Distance')

    err1 = std(TP1');
    err2 = std(TP2');
    figure;
    errorbar(mean(TP1,2),err1,'-o','color','r');
    hold on;
    errorbar(mean(TP2,2),err2,'-o','color','b');
    legend('Group 1','Group 2');
    ylabel('Throughput');
    xlabel('Test Number');
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Throughput');
end
