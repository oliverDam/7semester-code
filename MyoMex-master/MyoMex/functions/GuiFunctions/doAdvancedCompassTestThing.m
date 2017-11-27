% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function doAdvancedCompassTestThing(handles, m1,sensX,sensY)

    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    
    getRegressValue = [ones(9,2)*0]
    pause(0.1);

    plothandle = handles;
    if ~isempty(plothandle);
        cla();
        max_lim = 1;
        x_fake = [0 max_lim 0 -max_lim];
        y_fake = [max_lim 0 -max_lim 0]
        h_fake = compass(x_fake,y_fake)
        hold on;
        
        axes(plothandle);
        
        set(h_fake,'Visible','off');
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        buffer1 = 0;
        buffer2 = 0;
        lol = compass(0,0);
        windowSize = 40;
        allPoint = 1;
        onPoint = 1;
        radius = 0.1;
        valueToPlot = [0,0];
        iGotZePointz = 0;
        randomOrder = randperm(8,8)    %find random order for targetplots
        plotData = [0.5 , 0.7 , 0.5 , 0 , -0.5 , -0.7 , -0.5 , 0; 0.5 , 0 , -0.5 , -0.7 , -0.5 , 0 , 0.5 , 0.7];
        
        %Makes sure we'll record for the stated 'recordingTime'
        while allPoint ~= 9
            
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
                
                if onPoint == 1;
                    datplotData = plotData(:,randomOrder(1,allPoint));     % choose random plot.
                    %h=[];
                    targetAreaX = [datplotData(1,1)-radius; datplotData(1,1)-radius; datplotData(1,1)+radius; datplotData(1,1)+radius; datplotData(1,1)-radius];
                    targetAreaY = [datplotData(2,1)-radius; datplotData(2,1)+radius; datplotData(2,1)+radius; datplotData(2,1)-radius; datplotData(2,1)-radius];
                    h_target = plot(targetAreaX,targetAreaY,'r');
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
                    
                    %This is also ok featz cause we so streetz:
                    featz = featureExtractionLiveLogVar(toBeFiltered);
                    getRegressValue = [getRegressValue;getRegressionValue(featz,mahExtensionRegrizzle, ...
                       mahFlexionRegrizzle,mahRadialRegrizzle,mahUlnarRegrizzle)];
                   
                    valueToPlot = mean(getRegressValue(end-5:end,:));
                    
                    axes(plothandle);
                    delete(lol);
                    lol = compass(sensX*valueToPlot(1),sensY*valueToPlot(2));
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
                    featz = featureExtractionLiveLogVar(toBeFiltered);
                    getRegressValue = [getRegressValue;getRegressionValue(featz,mahExtensionRegrizzle, ...
                        mahFlexionRegrizzle,mahRadialRegrizzle,mahUlnarRegrizzle)];
                    
                    valueToPlot = mean(getRegressValue(end-5:end,:));
                    
                    axes(plothandle);
                    delete(lol);
                    lol = compass(sensX*valueToPlot(1),sensY*valueToPlot(2));
                    drawnow;
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
                
                iGotZePointz = inpolygon(sensX*valueToPlot(1),sensY*valueToPlot(2),targetAreaX,targetAreaY);
                if iGotZePointz == 1 
                    onPoint = 1;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 1;
                    allPoint = allPoint+1;
                    delete(h_target)
                elseif time-timeStart(allPoint) >= 45
                    onPoint = 1;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 0;
                    allPoint = allPoint+1;
                    delete(h_target)
                end
                
            end
        end
    end
    save('timeStart.mat','timeStart');
    save('timeEnd.mat','timeEnd');
    save('gotIt.mat','gotIt');
    save('EmgMatrix.mat','EmgMatrix');
end