% This function retrieves the weighted regression values and plots them in
% the compass plot. This is a training plot which means we don't have any
% targets appearing at all.

function compassClassification(handles, handles2, m1, sensX, sensY)


    load('baseline.mat');
    load('MdlLinear.mat');
    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    
    getRegressValue = [ones(9,2)*0];
    pause(0.1);

    plothandle = handles;
    plothandle2 = handles2;
    if ~isempty(plothandle);
        cla();
        axes(plothandle);
        max_lim = 1;
        x_fake = [0 max_lim 0 -max_lim];
        y_fake = [max_lim 0 -max_lim 0];
        h_fake = compass(x_fake,y_fake);
        hold on;
        set(h_fake,'Visible','off');
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        
        recordingTime = 100000000;
        buffer1 = 0;
        buffer2 = 0;
        time = 0;
        lol = compass(0,0);
        windowSize = 40;
        
        %Makes sure we'll record for the stated 'recordingTime'
        while time <= 60
            
            %This has been stolen from MyoMex to retrieve data:
            timeEMG = m1.timeEMG_log;
            if ~isempty(timeEMG)
                iiEMG = find(timeEMG>=(timeEMG(end)-2));
                tEMG = timeEMG(iiEMG);
                EmgMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
                lastSample = max(iiEMG);
                timeIMU = m1.timeIMU_log;
                iiIMU = find(timeIMU>=(timeIMU(end)-2));
                %First window:
                if lastSample >= windowSize && buffer1 >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    toBeFiltered = toBeFiltered - baseline;
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %This is also ok featz cause we so streetz:
                    feat = featureExtractionLiveMAV(toBeFiltered);
                    getRegressValue = [getRegressValue;getRegressionValue(feat,mahExtensionRegrizzle, ...
                        mahFlexionRegrizzle,mahRadialRegrizzle,mahUlnarRegrizzle)];
                   
                    %Gets the classifier values:
                    classValue = getClassificationValue(feat,MdlLinear);
                    bar(plothandle2,classValue);
                    
                    valueToPlot = mean(getRegressValue(end-5:end,:));
                    
                    axes(plothandle);
                    delete(lol);
                    lol = compass(plothandle,sensX*valueToPlot(1),sensY*valueToPlot(2));
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
                    toBeFiltered = toBeFiltered - baseline;
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %This is also ok featz cause we so streetz:
                    feat = featureExtractionLiveLogVar(toBeFiltered);
                    getRegressValue = [getRegressValue;getRegressionValue(feat,mahExtensionRegrizzle, ...
                        mahFlexionRegrizzle,mahRadialRegrizzle,mahUlnarRegrizzle)];
                   
                    %Gets the classifier values:
                    classValue = getClassificationValue(feat,MdlLinear);
                    bar(plothandle2,classValue);
                    
                    %Finds the values to plot:
                    valueToPlot = mean(getRegressValue(end-5:end,:));
                    
                    delete(lol);
                    lol = compass(plothandle,sensX*valueToPlot(1),sensY*valueToPlot(2));
                    drawnow;
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
            end
        end
    end
end
