% This function retrieves the weighted regression values and plots them in
% the compass plot. This is a training plot which means we don't have any
% targets appearing at all.

function classificationTraining(handles,handles2,handles3,handles4, m1)


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
    images(8) = {imread('3.png')};
    images(9) = {imread('2.png')};
    images(10) = {imread('1.png')};
    
    pause(0.1);

    plothandle = handles;
    texthandle = handles2;
    imagehandle = handles3;
    texthandle2 = handles4;

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
        
        
%         axes(imagehandle);
%         curImg = cell2mat(images(1));
%         image(curImg);
%         axis off;
%         axis image;
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        
        classVal = [0 0 0 0 0 0 0 ; 0 0 0 0 0 0 0];
        buffer1 = 0;
        buffer2 = 0;
        tresVal = 0.15
        RV = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
        time = 0;
        windowSize = 40;
        maxTime = 720;
        moveTime = 30;
        pauseTime = 10;
        thisTime = -10;
        stopNow = 0;
        i = 1;
        j = 1;
        numLvl = [0.15 0.35 0.55 0.75; 0.25 0.45 0.65 0.85];
        strLvl = {'15-25' '35-45' '55-65' '75-85'};
        lim4green = [numLvl(1,1),numLvl(2,1)];
        
        set(texthandle2,'String',strLvl(j));
        
        axes(imagehandle);
        curImg = cell2mat(images(i));
        image(curImg);
        axis off;
        axis image;
        
        %Makes sure we'll record for the stated 'recordingTime'
        while stopNow ~= 1
            
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
                    
                    %Changes an image and intensity
                    if time-thisTime >= moveTime
                        %Here comes the pause:
                        axes(imagehandle);
                        curImg = cell2mat(images(7));
                        image(curImg);
                        axis off;
                        axis image;
                        set(someBars,'XData',[1 2 3 4 5 6 7],'Ydata',[0 0 0 0 0 0 0]);
                        pause(pauseTime-3);
                        curImg = cell2mat(images(8));
                        image(curImg);
                        axis off;
                        axis image;
                        pause(1);
                        curImg = cell2mat(images(9));
                        image(curImg);
                        axis off;
                        axis image;
                        pause(1);
                        curImg = cell2mat(images(10));
                        image(curImg);
                        axis off;
                        axis image;
                        pause(1);

                        %Avoids problems with matrixes and stuff. Stay in
                        %the matrix!
                        if i == 6
                            i = 1;
                            j = j+1;
                            if j == 5
                                stopNow = 1;
                                j = 4;
                            end
                        else
                            i = i+1;
                        end
                        
                        %Then we update the images and stuff!                        
                        axes(imagehandle);
                        curImg = cell2mat(images(i));
                        image(curImg);
                        axis off;
                        axis image;
                        set(texthandle2,'String',strLvl(j));
                        lim4green = [numLvl(1,j),numLvl(2,j)];
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
                    classToPlot = mean(classVal(len-2:len,:));   
                    
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
                    drawnow;
                    
                    if lim4green(2) >= max(RVTP) && max(RVTP) >= lim4green(1) && classToPlot(i) >= 0.8
                    set(texthandle,'BackgroundColor','g');
                else
                    set(texthandle,'BackgroundColor','r');
                end

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
                    classToPlot = mean(classVal(len-2:len,:));
                    
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
                    drawnow;

                if lim4green(2) >= max(RVTP) && max(RVTP) >= lim4green(1) && classToPlot(i) >= 0.8
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

