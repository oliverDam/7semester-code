% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(sliderValue, handles, m1)
%Tries to load the MVC we've recorded:
try
    load('MVC.mat');
    load('baseline.mat');
    maximum = max(MVC);
    disp('MVC and baseline found');
    isError = 0;
catch
    warning('MVC not found - go record it before trying again');
    isError = 1;
end

%Will only do the following if there's no error
if isError ~= 1
    pause(0.1);
    
    %Creates the trapezoid based on the slidervalue from the input.
    x = [0 2000 4000 7000 9000 10000];
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
        buffer1 = 0;
        buffer2 = 0;
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
                    
                    %This is also ok for a window and such stuff.
                    meanAbs = mean(abs(filterEmg));
                    
                    %Rescales the input between 0 and our MVC and finds the
                    %max value in the output vector to plot:
                    meanAbs = removeBaseline(meanAbs, baseline);
                    maxEmg = max(rescaleMatrix(meanAbs,MVC))
                    
                    %Plots the dot:
                    axes(plothandle);
                    delete(lol);
                    lol = plot(time*1000, maxEmg, 'or', 'MarkerSize', ...
                        5, 'MarkerFaceColor', 'g');
                    drawnow;
                    accelMatrix = m1.accel_log(iiIMU,:);
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
                    
                    %This is also ok for a window and such stuff.
                    meanAbs = mean(abs(filterEmg));
                    
                    %Rescales the input between 0 and our MVC and finds the
                    %max value in the output vector to plot:
                    meanAbs = removeBaseline(meanAbs, baseline);
                    maxEmg = max(rescaleMatrix(meanAbs,MVC))
                    
                    %Plots the dot:
                    axes(plothandle);
                    delete(lol);
                    lol = plot(time*1000, maxEmg, 'or', 'MarkerSize', ...
                        5, 'MarkerFaceColor', 'g');
                    drawnow;
                    accelMatrix = m1.accel_log(iiIMU,:);
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
            end
        end
    end
    
    %This could be changed in order to save it as a specific file (might
    %be able to do it with a textfield in the GUI before testing?):
    save('AccelData.mat','accelMatrix');
    EmgMatrix = butterFilter(EmgMatrix);
    save('EmgData.mat','EmgMatrix');
end
end
