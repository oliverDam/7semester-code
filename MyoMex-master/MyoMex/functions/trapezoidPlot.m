% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(sliderValue, handles, m1)
%Tries to load the MVC we've recorded:
try
    load('MVC.mat');
    maximum = max(MVC);
    disp('MVC found');
    isError = 0;
catch
    warning('MVC not found - go record it before trying again');
    isError = 1;
end

%Will only do the following if there's no error
if isError ~= 1
    pause(0.1);
    
    %Creates the trapezoid based on the slidervalue from the input.
    x = [0 2000 4000 8000 9000 10000];
    y = [0.01, 0.01, sliderValue, sliderValue, 0.01 0.01];
    plothandle = handles;
    if ~isempty(plothandle);
        cla();
        hold on;
        axes(plothandle);
        plot(x,y);
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        recordingTime = 10;
        buffer = 0;
        time = 0;
        lol = plot(0,0);
        windowSize = 40;
        
        %Makes sure we'll record for the stated 'recordingTime'
        while time <= recordingTime
            
            %This has been stolen from MyoMex to retrieve data:
            timeEMG = m1.timeEMG_log;
            if ~isempty(timeEMG)
                iiEMG = find(timeEMG>=(timeEMG(end)-2));
                tEMG = timeEMG(iiEMG);
                dataMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
                
                %Makes sure we get the stated 'windowSize' of the buffer
                lastSample = max(iiEMG);
                if lastSample >= windowSize && buffer >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = dataMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %This is also ok for a window and such stuff.
                    meanAbs = mean(abs(filterEmg));
                    
                    %Rescales the input between 0 and our MVC and finds the
                    %max value in the output vector to plot:
                    maxEmg = max(rescaleMatrix(meanAbs,MVC));
                    
                    %Plots the dot:
                    axes(plothandle);
                    delete(lol);
                    lol = plot(time*1000, maxEmg, 'or', 'MarkerSize', ...
                        5, 'MarkerFaceColor', 'g');
                    drawnow;
                    buffer = 0;
                else
                    buffer = buffer + 1;
                end
            end
        end
    end
    
    %This could be changed in order to save it as a specific file (might
    %be able to do it with a textfield in the GUI before testing?):
    dataMatrix = butterFilter(dataMatrix);
    save('testData.mat','dataMatrix');
end
end
