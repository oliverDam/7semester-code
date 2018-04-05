%This is for the moving dot thing:

function targetTest(handles1, handles2, m1)

%value = prevValue + value
%plot(handle,value+prevValue,'or', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    load('MdlLinear.mat');

%Setup of the plot:
plothandle = handles1;
plothandle2 = handles2;

    if ~isempty(plothandle);
        cla();
        axes(plothandle);
        x = [-20,20,20,-20,-20];
        y = [20,20,-20,-20,20];
        extra = plot(x,y);
        xlim([-20 20]);
        ylim([-20 20]);
        grid on;
        grid minor;
        hold on;
        
        axes(plothandle2)
        whyTho = [1 1 1 1 1];
        someBars = bar(plothandle2, whyTho,'c');
        ylim([0 1]);
        str = {'Extension','Flexion','Radial','Ulnar','Rest'};
        set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
        hold on;        
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.        
        buffer1 = 0;
        buffer2 = 0;
        windowSize = 40;
        allPoint = 1;
        onPoint = 1;
        radius = 1;
        outputValue = [0,0];
        gotPoint = 0;

        regressValue = [];
        classVal = [0 0 0 0 0; 0 0 0 0 0]
        barplot = bar(plothandle2,[0 0 0 0 0]);
        
        %This determines how long we can try to get to the area.
        maxTime = 5; 
        
        %Begin the test at x = 0 & y = 0.
        prevValue = [0,0];
        lol = scatter(plothandle,prevValue(1),prevValue(2),'b', ...
            'MarkerFaceColor','r');
        
        %randomOrder = randperm(8,8)    %find random order for targetplots
        randomOrder = (1:31); % not random anymore
        plotData = 10*[0.30 ,0, 0.30 ,0, 0.30 ,0, 0 ,0, -0.30 ,0, -0.30 ,0, -0.30 ,0, 0 , ... 
            0, 0.60 ,0, 0.75 ,0, 0.60 ,0, 0 ,0, -0.60 ,0, -0.75 ,0, -0.60 ,0, 0; ...
            0.30 ,0 , 0 ,0, -0.30 ,0, -0.30 ,0, -0.30 ,0, 0 ,0, 0.30 ,0, 0.30 , ...
            0, 0.60 ,0, 0 ,0, -0.60 ,0, -0.75 ,0, -0.60 ,0, 0 ,0, 0.60 ,0, 0.75];
            
        %Makes sure we'll record for the stated 'recordingTime'
        while allPoint ~= 32
            
            %This has been stolen from MyoMex to retrieve data:
            timeEMG = m1.timeEMG_log;
            if ~isempty(timeEMG)
                iiEMG = find(timeEMG>=(timeEMG(end)-2));
                tEMG = timeEMG(iiEMG);
                EmgMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
                lastSample = max(iiEMG);
                timeIMU = m1.timeIMU_log;
                iiIMU = find(timeIMU>=(timeIMU(end)-2));
                time = m1.timeEMG;
                
                %This is when we're on point and need to plot a new square
                if onPoint == 1;
                    datplotData = plotData(:,randomOrder(1,allPoint));     % choose random plot.
                    %h=[];

                    targetAreaX = [datplotData(1,1)-radius; ... 
                        datplotData(1,1)-radius; datplotData(1,1)+radius;...
                        datplotData(1,1)+radius; datplotData(1,1)-radius];
                    
                    targetAreaY = [datplotData(2,1)-radius; ...
                        datplotData(2,1)+radius; datplotData(2,1)+radius;...
                        datplotData(2,1)-radius; datplotData(2,1)-radius];

                    h_target = plot(plothandle,targetAreaX,targetAreaY,'r');
                    %axis(plothandle,[-max_lim max_lim -max_lim max_lim]);
                    timeStart(allPoint) = time;
                    onPoint = 0;
                end
                
                %First window:
                if lastSample >= windowSize && buffer1 >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %Extraction of the features:
                    featMav = featureExtractionLiveMAV(toBeFiltered);
                    featSSC = mean(featureExtractionSSC(toBeFiltered));
                    featWL = mean(featureExtractionWL(toBeFiltered));
                    featZC = mean(featureExtractionZC(toBeFiltered));
                    
                    feat = [featMav, featSSC, featWL, featZC];
                    
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    set(someBars,'XData',[1 2 3 4 5],'YData',classToPlot);
                    
                    regressValue = [regressValue;getSingleRegression(featMav,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression,classToPlot)]; 
                    
                    %delete(barplot);
                    %barplot = bar(plothandle2,classToPlot,'g');
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];
                    
                    axes(plothandle);
                    set(lol,'XData',outputValue(end,1),'YData',outputValue(end,2));
                    %delete(lol);
                    %lol = scatter(plothandle, outputValue(end,1),outputValue(end,2),'b', ...
            %'MarkerFaceColor','r');
                    
                    drawnow;
                    
                    buffer1 = 0;
                else 
                    buffer1 = buffer1 + 1;
                end
                
                %%Second window:
                if lastSample >= windowSize+20 && buffer2 >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %This is also ok featz cause we so streetz:
                    featMav = featureExtractionLiveMAV(toBeFiltered);
                    featSSC = mean(featureExtractionSSC(toBeFiltered));
                    featWL = mean(featureExtractionWL(toBeFiltered));
                    featZC = mean(featureExtractionZC(toBeFiltered));
                    
                    feat = [featMav, featSSC, featWL, featZC];
                    
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    %delete(barplot);
                    %barplot = bar(plothandle2,classToPlot,'g');
                    
                    regressValue = [regressValue;getSingleRegression(featMav,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression,classToPlot)];
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];
                    
                    axes(plothandle);
                    set(lol,'XData',outputValue(end,1),'YData',outputValue(end,2));
                    %delete(lol);
                    %lol = scatter(plothandle,outputValue(end,1),outputValue(end,2),'b', ...
            %'MarkerFaceColor','r');
                    
                    drawnow;
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
                
                gotPoint = inpolygon(outputValue(end,1),outputValue(end,2),targetAreaX,targetAreaY);
                if gotPoint == 1 
                    onPoint = 1;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 1;
                    allPoint = allPoint+1;
                    delete(h_target)
                elseif time-timeStart(allPoint) >= maxTime
                    onPoint = 1;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 0;
                    allPoint = allPoint+1;
                    delete(h_target)
                end
                
            end
        end
    end
    gotIt = gotIt(1:2:end);
    testResult = sum(timeEnd-timeStart)/sum(gotIt);
    timeDif = timeEnd-timeStart;
    
    save('testResult.mat','testResult');
    save('timeStart.mat','timeStart');
    save('timeEnd.mat','timeEnd');
    save('timeDif.mat','timeDif');
    save('gotIt.mat','gotIt');
    save('EmgMatrix.mat','EmgMatrix');
    save('outputValue.mat','outputValue');
end
