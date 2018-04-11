%This is for the moving dot thing:

function targetTest(handles1, handles2, m1)

%value = prevValue + value
%plot(handle,value+prevValue,'or', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    load('FistRegression.mat');
    load('StretchRegression.mat');
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
        whyTho = [1 1 1 1 1 1 1];
        someBars = bar(plothandle2, whyTho,'b');
        ylim([0 1]);
        str = {'Extension','Flexion','Radial','Ulnar','Fist','Stretch','Rest'};
        set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
        hold on;        
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.        
        buffer1 = 0;
        buffer2 = 0;
        Max = 19.5;
        Min = -19.5;
        MaxRad = 150;
        MinRad = 5;
        windowSize = 40;
        allPoint = 1;
        onPoint = 1;
        radius = 1;
        outputValue = [0,0,10];
        gotPoint = 0;
        gotTime = 0;
        timeAtPoint = 2;

        regressValue = [];
        classVal = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0]
        barplot = bar(plothandle2,[0 0 0 0 0 0 0]);
        
        %This determines how long we can try to get to the area.
        maxTime = 50; 
        
        %Begin the test at x = 0 & y = 0.
        prevValue = [0,0];
        lol = plot(plothandle,prevValue(1),prevValue(2),'b', 'Marker', 'o', ...
             'MarkerFaceColor','r');
        
        %randomOrder = randperm(8,8)    %find random order for targetplots
        randomOrder = (1:31); % not random anymore
        plotData = 10*[0.30 ,0, 0.30 ,0, 0.30 ,0, 0 ,0, -0.30 ,0, -0.30 ,0, -0.30 ,0, 0 , ... 
            0, 0.60 ,0, 0.75 ,0, 0.60 ,0, 0 ,0, -0.60 ,0, -0.75 ,0, -0.60 ,0, 0; ...
            0.30 ,0 , 0 ,0, -0.30 ,0, -0.30 ,0, -0.30 ,0, 0 ,0, 0.30 ,0, 0.30 , ...
            0, 0.60 ,0, 0 ,0, -0.60 ,0, -0.75 ,0, -0.60 ,0, 0 ,0, 0.60 ,0, 0.75];
        SizeOfDot = 2*rand(1,30);

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
                if onPoint == 1
                    datplotData = plotData(:,randomOrder(1,allPoint));     % choose random plot.
                    %h=[];

                    targetAreaX = [datplotData(1,1)-radius; ... 
                        datplotData(1,1)-radius; datplotData(1,1)+radius;...
                        datplotData(1,1)+radius; datplotData(1,1)-radius];
                    
                    targetAreaY = [datplotData(2,1)-radius; ...
                        datplotData(2,1)+radius; datplotData(2,1)+radius;...
                        datplotData(2,1)-radius; datplotData(2,1)-radius];

                    %h_target = plot(plothandle,targetAreaX,targetAreaY,'r');
                    %axis(plothandle,[-max_lim max_lim -max_lim max_lim]);
                    
                    %Plots the circle:
                    r = SizeOfDot(randomOrder(1,allPoint));
                    x = datplotData(1);
                    y = datplotData(2);
                    d = r*2;
                    px = x-r;
                    py = y-r;
                    h_target = rectangle(plothandle,'Position',[px py d d],'Curvature',[1,1]);
                    
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
                    set(someBars,'XData',[1 2 3 4 5 6 7],'YData',classToPlot);
                    
                    regressValue = [regressValue;getSingleRegression(featMav,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot)]; 
                    
                    %delete(barplot);
                    %barplot = bar(plothandle2,classToPlot,'g');
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];
                    
                    XData = outputValue(end,1);
                    YData = outputValue(end,2);
                    ZData = outputValue(end,3);
                    XData(XData>Max) = Max;
                    XData(XData<Min) = Min;
                    YData(YData>Max) = Max;
                    YData(YData<Min) = Min;
                    ZData(ZData>MaxRad) = MaxRad;
                    ZData(ZData<MinRad) = MinRad;
                    outputValue(end,:) = [XData,YData,ZData];

                    axes(plothandle);
                    set(lol,'XData',XData,'YData',YData);
                    set(lol,'MarkerSize',ZData);
                    
                    %set(lol,'XData',outputValue(end,1),'YData',outputValue(end,2));
                    %set(lol,'MarkerSize',outputValue(end,3));
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
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot)];
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];

                    %Makes sure the values doesn't fuck up:
                    XData = outputValue(end,1);
                    YData = outputValue(end,2);
                    ZData = outputValue(end,3);
                    XData(XData>Max) = Max;
                    XData(XData<Min) = Min;
                    YData(YData>Max) = Max;
                    YData(YData<Min) = Min;
                    ZData(ZData>MaxRad) = MaxRad;
                    ZData(ZData<MinRad) = MinRad;
                    outputValue(end,:) = [XData,YData,ZData];

                    axes(plothandle);
                    set(lol,'XData',XData,'YData',YData);
                    set(lol,'MarkerSize',ZData);
                    %delete(lol);
                    %lol = scatter(plothandle,outputValue(end,1),outputValue(end,2),'b', ...
            %'MarkerFaceColor','r');
                    
                    drawnow;
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
                
                gotPoint = inpolygon(outputValue(end,1),outputValue(end,2),targetAreaX,targetAreaY);
                
                if gotPoint == 1 && (r*35)-5 <= outputValue(end,3) && (r*35)+5 >= outputValue(end,3) && gotTime == 0
                    startTime = time;
                    gotTime = 1;
                elseif gotPoint == 1 && (r*35)-5 <= outputValue(end,3) && (r*35)+5 >= outputValue(end,3) ...
                        && gotTime == 1 && time-startTime >= timeAtPoint
                    onPoint = 1;
                    gotTime = 0;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 1;
                    allPoint = allPoint+1;
                    delete(h_target);
                elseif time-timeStart(allPoint) >= maxTime
                    onPoint = 1;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 0;
                    allPoint = allPoint+1;
                    delete(h_target);
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
