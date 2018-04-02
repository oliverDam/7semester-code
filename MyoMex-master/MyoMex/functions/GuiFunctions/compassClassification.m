% This function retrieves the weighted regression values and plots them in
% the compass plot. This is a training plot which means we don't have any
% targets appearing at all.

function compassClassification(handles, handles2, m1, sensX, sensY)


    load('baseline.mat');
    
    %%Change to this to get a single model:
    load('MdlLinear.mat');
    
    %%Multi model
    %load('MdlLinearExtFle.mat');
    %load('MdlLinearRadUln.mat');
    
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
        
        axes(plothandle2)
        whyTho = [1 1 1 1 1];
        someBars = bar(plothandle2, whyTho,'w');
        str = {'Extension','Flexion','Radial','Ulnar','Rest'};
        set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
        hold on;
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        
        classVal = [0 0 0 0 0 ; 0 0 0 0 0];
        buffer1 = 0;
        buffer2 = 0;
        time = 0;
        lol = compass(0,0);
        windowSize = 40;
        lim4Green = 0.75
        %barplot = bar(plothandle2,[0 0 0 0]);
        barplot1 = bar(plothandle2,1,0);
        barplot2 = bar(plothandle2,2,0);
        barplot3 = bar(plothandle2,3,0);
        barplot4 = bar(plothandle2,4,0);
        barplot5 = bar(plothandle2,5,0);
        
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
                    featMav = featureExtractionLiveMAV(toBeFiltered);
                    featSSC = mean(featureExtractionSSC(toBeFiltered));
                    featWL = mean(featureExtractionWL(toBeFiltered));
                    featZC = mean(featureExtractionZC(toBeFiltered));
                    
                    feat = [featMav, featSSC, featWL, featZC];
                    
                    getRegressValue = [getRegressValue;getRegressionValue(featMav,ExtensionRegression, ...
                        FlexionRegression,RadialRegression,UlnarRegression)];
                   
                    %%Gets the classifier values with a single model:
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    %
                    %delete(barplot);
                    %barplot = bar(plothandle2,classToPlot,'g');
                    
                    delete(barplot1);
                    delete(barplot2);
                    delete(barplot3);
                    delete(barplot4);
                    delete(barplot5);
                    
                    if classToPlot(1) >= lim4Green
                        barplot1 = bar(plothandle2,1,classToPlot(1),'g')
                    else
                        barplot1 = bar(plothandle2,1,classToPlot(1),'r')
                    end
                    if classToPlot(2) >= lim4Green
                        barplot2 = bar(plothandle2,2,classToPlot(2),'g')
                    else
                        barplot2 = bar(plothandle2,2,classToPlot(2),'r')
                    end
                    if classToPlot(3) >= lim4Green
                        barplot3 = bar(plothandle2,3,classToPlot(3),'g')
                    else
                        barplot3 = bar(plothandle2,3,classToPlot(3),'r')
                    end
                    if classToPlot(4) >= lim4Green
                        barplot4 = bar(plothandle2,4,classToPlot(4),'g')
                    else
                        barplot4 = bar(plothandle2,4,classToPlot(4),'r')
                    end
                    if classToPlot(5) >= lim4Green
                        barplot5 = bar(plothandle2,5,classToPlot(5),'g')
                    else
                        barplot5 = bar(plothandle2,5,classToPlot(5),'r')
                    end
                    
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
                    featMav = featureExtractionLiveMAV(toBeFiltered);
                    featSSC = mean(featureExtractionSSC(toBeFiltered));
                    featWL = mean(featureExtractionWL(toBeFiltered));
                    featZC = mean(featureExtractionZC(toBeFiltered));
                    
                    feat = [featMav, featSSC, featWL, featZC];

                    getRegressValue = [getRegressValue;getRegressionValue(featMav,ExtensionRegression, ...
                        FlexionRegression,RadialRegression,UlnarRegression)];
                   
                    %%Gets the classifier values:
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    %delete(barplot);
                    %barplot = bar(plothandle2,classToPlot,'g');
                    
                    %Colorful barplot:                    
                    delete(barplot1);
                    delete(barplot2);
                    delete(barplot3);
                    delete(barplot4);
                    delete(barplot5);
                    
                    if classToPlot(1) >= lim4Green
                        barplot1 = bar(plothandle2,1,classToPlot(1),'g')
                    else
                        barplot1 = bar(plothandle2,1,classToPlot(1),'r')
                    end
                    if classToPlot(2) >= lim4Green
                        barplot2 = bar(plothandle2,2,classToPlot(2),'g')
                    else
                        barplot2 = bar(plothandle2,2,classToPlot(2),'r')
                    end
                    if classToPlot(3) >= lim4Green
                        barplot3 = bar(plothandle2,3,classToPlot(3),'g')
                    else
                        barplot3 = bar(plothandle2,3,classToPlot(3),'r')
                    end
                    if classToPlot(4) >= lim4Green
                        barplot4 = bar(plothandle2,4,classToPlot(4),'g')
                    else
                        barplot4 = bar(plothandle2,4,classToPlot(4),'r')
                    end
                    if classToPlot(5) >= lim4Green
                        barplot5 = bar(plothandle2,5,classToPlot(5),'g')
                    else
                        barplot5 = bar(plothandle2,5,classToPlot(5),'r')
                    end
                    
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
