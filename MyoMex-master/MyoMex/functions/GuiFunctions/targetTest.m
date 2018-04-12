%This is for the moving dot thing:

function targetTest(handles1, handles2, handles3, m1, targetSet)

    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    load('FistRegression.mat');
    load('StretchRegression.mat');
    load('MdlLinear.mat');
    load('MVCExtension.mat');

%Setup of the plot:
plothandle = handles1;
plothandle2 = handles2;
plothandle3 = handles3;

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
%         whyTho = [1 1 1 1 1 1 1];
%         someBars = bar(plothandle2, whyTho,'b');
%         ylim([0 1]);
%         str = {'Extension','Flexion','Radial','Ulnar','Fist','Stretch','Rest'};
%         set(gca, 'XTickLabel',str, 'XTick',1:numel(str),'Color','r');
%         hold on;    
        set(gca,'Color',[0.94 0.94 0.94]);
        ax = gca;
        ax.Visible = 'off';
        
        axes(plothandle3)
        set(gca,'Color',[0.94 0.94 0.94]);
        ax = gca;
        ax.Visible = 'off';
        
        
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
        timeAtPoint = 1;

        regressValue = [];
        classVal = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0]
%         barplot = bar(plothandle2,[0 0 0 0 0 0 0]);
        
        %This determines how long we can try to get to the area.
        maxTime = 50; 
        
        %Begin the test at x = 0 & y = 0.
        prevValue = [0,0];
        lol = plot(plothandle,prevValue(1),prevValue(2),'b', 'Marker', 'o', ...
             'MarkerFaceColor','r');
         
        %Decides what targetset to use:
        if targetSet == 1
            randomOrder = (1:16);
        elseif targetSet == 2
            randomOrder = [1,4,3,5,6,8,2,9,7,16,10,12,13,11,15,14];
        elseif targetSet == 3
            randomOrder = [4,5,1,7,6,3,10,14,13,16,8,11,2,15,12,9];
        elseif targetSet == 4
            randomOrder = [6,11,16,1,4,15,13,5,2,12,14,7,3,8,10,9];
        end
        
        plotData = ...
            2*[3,0,2,-1,-4,2,-5,1,6,-2,0,4,-4,-6,1,7 ...
            ;1,4,-3,4,0,-4,-6,2,5,-3,0,-4,2,7,1,4];
        SizeOfDot = [1 0.5 0.4 0.9 1.2 1.4 0.7 1.3 1 1.6 0.9 0.4 0.8 1.3 1.1 1.5];

        %Makes sure we'll record for the stated 'recordingTime'
        while allPoint ~= 17
            
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
                    r = SizeOfDot(randomOrder(1,allPoint));
                    radius = r*0.5;

                    targetAreaX = [datplotData(1,1)-radius; ... 
                        datplotData(1,1)-radius; datplotData(1,1)+radius;...
                        datplotData(1,1)+radius; datplotData(1,1)-radius];
                    
                    targetAreaY = [datplotData(2,1)-radius; ...
                        datplotData(2,1)+radius; datplotData(2,1)+radius;...
                        datplotData(2,1)-radius; datplotData(2,1)-radius];
                    
                    %Plots the circle:
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
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    feat = [featMAV, featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
%                     set(someBars,'XData',[1 2 3 4 5 6 7],'YData',classToPlot);
                    
                    regressValue = [regressValue;getSingleRegression(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot)]; 
                                        
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
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    feat = [featMAV, featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    regressValue = [regressValue;getSingleRegression(featMAV,...
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
