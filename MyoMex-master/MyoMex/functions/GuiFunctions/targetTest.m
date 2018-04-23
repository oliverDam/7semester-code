%This is for the moving dot thing:

function targetTest(handles1, handles3, handles4, handles5, handles6, handles7, m1, targetSet)

load('ExtensionRegression.mat');
load('FlexionRegression.mat');
load('RadialRegression.mat');
load('UlnarRegression.mat');
load('FistRegression.mat');
load('StretchRegression.mat');
load('MdlLinear.mat');
imageExte = imread('url.png');
imageFlex = imread('url2.png');
imageRadi = imread('url3.png');
imageUlna = imread('url4.png');
imageFist = imread('url5.png');
imageStre = imread('url6.png');
imageRest = imread('url7.png');

%Setup of the plot:
plothandle = handles1;
imhandle1 = handles4;
imhandle2 = handles5;
imhandle3 = handles6;
imhandle4 = handles7;
imhandle5 = handles3;

    if ~isempty(plothandle);
        axes(plothandle);
        cla(plothandle);
        axis on;
        x = [-20,20,20,-20,-20];
        y = [20,20,-20,-20,20];
        extra = plot(x,y);
        xlim([-20 20]);
        ylim([-20 20]);
        grid on;
        grid minor;
        hold on;
        
        %%Adds all the images to the GUI:
        axes(imhandle5)
        images = image(imageRest);
        axis off;
        axis image;
        
        axes(imhandle1)
        image(imageFlex);
        axis off;
        axis image;
        
        axes(imhandle2)
        image(imageUlna);
        axis off;
        axis image;
        
        axes(imhandle3)
        image(imageExte);
        axis off;
        axis image;
        
        axes(imhandle4)
        image(imageRadi);
        axis off;
        axis image;
        
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
        lim4green = 0.8;
        firstTime = 1;

        regressValue = [];
        classVal = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
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
        SizeOfDot = 2*[1 0.5 0.4 0.9 1.2 1.4 0.7 1.3 1 1.6 0.9 0.4 0.8 1.3 1.1 1.5];

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
                    radius = r/3;
                    
                    
                    dotLimit = [(r*30)-10, (r*30)+10];

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
                    rx = x-r/3;
                    ry = y-r/3;
                    h_target = rectangle(plothandle,'Position',[px py d d],'Curvature',[1,1]);
                    h_target2 = rectangle(plothandle,'Position',[rx ry d/3 d/3],'Curvature',[1 1]);
                    
                    startPoint(allPoint,:) = outputValue(end,:); %Where is the curser placed now and what is the size of it
                    timeStart(allPoint) = time; %Time when the new target shows up
                    overshoot(allPoint) = -1; %Has to be -1 to ensure 0 overshoots if target is reached in first try
                    onPoint = 0;
                    tresVal = 0.15;
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
                    
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    getRV = getSingleRegression(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    regressValue = [regressValue;getRV(1:3)]; 
                                        
                    if getRV(4) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
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
                    
                    axes(imhandle5);
                    delete(images);
                    %And here comes the image:
                    if classVal(end,1) >= lim4green
                        images = image(imageExte);
                    elseif classVal(end,2) >= lim4green
                        images = image(imageFlex);
                    elseif classVal(end,3) >= lim4green
                        images = image(imageRadi);
                    elseif classVal(end,4) >= lim4green
                        images = image(imageUlna);
                    elseif classVal(end,5) >= lim4green
                        images = image(imageFist);
                    elseif classVal(end,6) >= lim4green
                        images = image(imageStre);
                    else 
                        images = image(imageRest);
                    end
                    axis off;
                    axis image;
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
                    
                    %Retrieves the features needed for the classifier:
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    %Sets up our feature-matrix for the classifier:
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                    %Retrieves the new classification values:
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    %Gets the regression values for the dot-velocity:
                    getRV = getSingleRegression(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    regressValue = [regressValue;getRV(1:3)]; 
                                        
                    if getRV(4) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];

                    %All these lines sets the boundaries for the dot:
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

                    %Plots the dot w. both size and placement:
                    axes(plothandle);
                    set(lol,'XData',XData,'YData',YData);
                    set(lol,'MarkerSize',ZData);                    
                    drawnow;
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
                
                %Sets gotPoint to 1 if were inside the target area
                gotPoint = inpolygon(outputValue(end,1),outputValue(end,2),targetAreaX,targetAreaY);
                
                %Starts the timer if the size is correct as well:
                if gotPoint == 1 && dotLimit(1) <= outputValue(end,3) && dotLimit(2) >= outputValue(end,3) && gotTime == 0
                    if firstTime == 1
                        startTime = time;
                    end
                    gotTime = 1;
                    overshoot(allPoint) = overshoot(allPoint)+1;
                    startValue(allPoint) = length(outputValue);
                    set(lol,'MarkerFaceColor','g');
                    firstTime = 0;
                    
                %Resets if we get out of time again
                elseif gotTime == 1 && (gotPoint == 0 || (dotLimit(1) >= outputValue(end,3) || dotLimit(2) <= outputValue(end,3)))
                    gotTime = 0;
                    set(lol,'MarkerFaceColor','r');
                    firstTime = 1;
                    
                %Confirms the target is reached if we're still within the
                %area w. the correct size after "timeAtPoint":
                elseif gotPoint == 1 && dotLimit(1) <= outputValue(end,3) && dotLimit(2) >= outputValue(end,3) ...
                        && gotTime == 1 && time-startTime >= timeAtPoint
                    onPoint = 1;
                    firstTime = 1;
                    gotTime = 0;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 1;
                    allPoint = allPoint+1;
                    delete(h_target);
                    delete(h_target2);
                    stopValue(allPoint) = length(outputValue);
                    set(lol,'MarkerFaceColor','r');
                    
                %Cancels the target if not reached before "maxTime":
                elseif time-timeStart(allPoint) >= maxTime
                    onPoint = 1;
                    firstTime = 1;
                    gotTime = 0;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 0;
                    if overshoot(allPoint) == -1
                        overshoot(allPoint) = 0;
                    else
                        overshoot(allPoint) = overshoot(allPoint);
                    end
                    allPoint = allPoint+1;
                    delete(h_target);
                    delete(h_target2);
                    set(lol,'MarkerFaceColor','g');
                end
            end
        end
    end

    %Calculates a few results:
    %gotIt = gotIt(1:2:end);
    timeDif = timeEnd-timeStart;
    
    %Saving everything that we need to calculate the fitt's law results:
    save('overshoot.mat','overshoot');
    save('timeDif.mat','timeDif');
    save('startValue.mat','startValue');
    save('stopValue.mat','stopValue');
    save('gotIt.mat','gotIt');
    save('EmgMatrix.mat','EmgMatrix');
    save('outputValue.mat','outputValue');
end
