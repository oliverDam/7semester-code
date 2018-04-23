% This function retrieves the weighted regression values and plots them in
% the compass plot. This is a training plot which means we don't have any
% targets appearing at all.

function classificationTraining(handles,handles2,handles3, m1)


    load('baseline.mat');
    load('MdlLinear.mat');
    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    load('FistRegression.mat');
    load('StretchRegression.mat');
    
    images(1) = {imread('url.png')};
    images(2) = {imread('url2.png')};
    images(3) = {imread('url3.png')};
    images(4) = {imread('url4.png')};
    images(5) = {imread('url5.png')};
    images(6) = {imread('url6.png')};
    images(7) = {imread('url7.png')};
    
    pause(0.1);

    plothandle = handles;
    texthandle = handles2;
    imagehandle = handles3;

    if ~isempty(plothandle)
        cla(plothandle);        
        axes(plothandle)
        axis on;
        axis auto;
        whyTho = [1 1 1 1 1 1 1];
        someBars = bar(plothandle, whyTho, 'b');
        ylabel('Confidence Score in %')
        ylim([0 100]);
        str = {' ',' ',' ',' ',' ',' ',' '};
        set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
        hold on;
        
        axes(imagehandle);
        curImg = cell2mat(images(1));
        image(curImg);
        axis off;
        axis image;
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        
        classVal = [0 0 0 0 0 0 0 ; 0 0 0 0 0 0 0];
        buffer1 = 0;
        buffer2 = 0;
        tresVal = 0.15
        RV = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
        time = 0;
        windowSize = 40;
        maxTime = 120;
        thisTime = 0;
        lim4green = [0.75 1];
        i = 2;
        
        %Makes sure we'll record for the stated 'recordingTime'
        while time <= 600
            
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
                    
                    %Changes an image
                    if time-thisTime >= maxTime/6
                        axes(imagehandle);
                        curImg = cell2mat(images(i));
                        image(curImg);
                        axis off;
                        axis image;
                        i = i+1;
                        thisTime = time;
                    end
                    
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
                    
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                        %%Gets the classifier values with a single model:
                        classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    
                    len = size(classVal,1);
                    classToPlot = decideClass(mean(classVal(len-2:len,:)));
                    
                    getRV = getRegVal(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    RV = [RV;getRV(1:7)]; 
                    
                    if getRV(8) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    RVTP = mean(RV(len-2:len,:));
                    
                    axes(plothandle);
                    set(someBars,'XData',[1 2 3 4 5 6 7],'Ydata',100*classToPlot);
                    set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
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
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                        %%Gets the classifier values:
                        classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    
                    len = size(classVal,1);
                    classToPlot = decideClass(mean(classVal(len-2:len,:)));
                    
                    getRV = getRegVal(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    RV = [RV;getRV(1:7)]; 
                    
                    if getRV(8) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    RVTP = mean(RV(len-2:len,:));
                    
                    set(texthandle,'String',num2str(int8(100*sum(RVTP))));
                    
                    axes(plothandle);
                    set(someBars,'XData',[1 2 3 4 5 6 7],'Ydata',100*classToPlot);
                    set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
                    drawnow;

                if (lim4green(1) <= max(sum(RVTP))) && (max(sum(RVTP)) <= lim4green(2))
                    set(texthandle,'BackgroundColor','g');
                else
                    set(texthandle,'BackgroundColor','r');
                end
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
            end
        end
    end
end
                