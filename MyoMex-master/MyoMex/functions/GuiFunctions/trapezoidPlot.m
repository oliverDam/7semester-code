% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(sliderValue, handles, handles2, m1, movementType)

    if movementType == 1
        movement = 'Flexion';
    elseif movementType == 2
        movement = 'Extension';
    elseif movementType == 3
        movement = 'Radial';
    else
        movement = 'Ulnar';
    end

    MVC = cell2mat(struct2cell(load(convertCharsToStrings(strcat('MVC',movement,'.mat')))));
    load('baseline.mat');
    
    maximum = mean(MVC)
    disp('MVC and baseline found');
    isError = 0;

%Will only do the following if there's no error
if isError ~= 1
    pause(0.1);
    
    %Creates the trapezoid based on the slidervalue from the input.
    if movementType == 5
        x = [0 2000 5000 10000 35000 45000]
        y = [0.05 0.05 0.05 0.05 0.05 0.05]
    else
        x = [0 2000 5000 10000 13000 15000];
        y = [0.01, 0.01, sliderValue, sliderValue, 0.01 0.01];
    end
    
    handleplot = handles2;
    plothandle = handles;
    if ~isempty(plothandle);
        cla();
        axes(plothandle);
        trapezoid = plot(x,y);
        if movementType == 5
            xlim([0 45000]);
        else
            xlim([0 15000]);
        end
        ylim([0 1]);
        hold on;
        xlabel('Time in ms');
        ylabel('EMG intensity');
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        if movementType == 5
            recordingTime = 45;
        else 
            recordingTime = 15;
        end
        
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
                    ClMeanAbs = mean(removeBaseline(meanAbs, baseline));
                    meanEmg = rescale(ClMeanAbs,'InputMin',0,'InputMax',maximum);
                    
                    %Plots the dot:
                    %axes(plothandle);
                    delete(lol);
                    lol = plot(plothandle, time*1000, meanEmg, 'or', 'MarkerSize', ...
                        10, 'MarkerFaceColor', 'g');
                    drawnow;
                    realSpiderplot(handleplot,meanAbs);
%                     accelMatrix = m1.accel_log(iiIMU,:);
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
                    ClMeanAbs = mean(removeBaseline(meanAbs, baseline));
                    meanEmg = rescale(ClMeanAbs,'InputMin',0,'InputMax',maximum);
                    
                    %Plots the dot:
                    %axes(plothandle);
                    delete(lol);
                    lol = plot(plothandle,time*1000, meanEmg, 'or', 'MarkerSize', ...
                        10, 'MarkerFaceColor', 'g');
                    drawnow;
                    realSpiderplot(handleplot,meanAbs);
%                     accelMatrix = m1.accel_log(iiIMU,:);
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
            end
        end
    end

delete(trapezoid);
%%Saving with a specific name instead of the same for every case:
Intensity = num2str(sliderValue*100);

if movementType == 1
    if sliderValue == 0.4
        EmgFlexion40 = butterFilter(EmgMatrix);
    elseif sliderValue == 0.5
        EmgFlexion50 = butterFilter(EmgMatrix);
    else
        EmgFlexion70 = butterFilter(EmgMatrix);
    end
    
elseif movementType == 2
    if sliderValue == 0.4
        EmgExtension40 = butterFilter(EmgMatrix);
    elseif sliderValue == 0.5
        EmgExtension50 = butterFilter(EmgMatrix);
    else
        EmgExtension70 = butterFilter(EmgMatrix);
    end
    
elseif movementType == 3
    if sliderValue == 0.4
        EmgRadial40 = butterFilter(EmgMatrix);
    elseif sliderValue == 0.5
        EmgRadial50 = butterFilter(EmgMatrix);
    else
        EmgRadial70 = butterFilter(EmgMatrix);
    end
    
elseif movementType == 4
    if sliderValue == 0.4
        EmgUlnar40 = butterFilter(EmgMatrix);
    elseif sliderValue == 0.5
        EmgUlnar50 = butterFilter(EmgMatrix);
    else
        EmgUlnar70 = butterFilter(EmgMatrix);
    end
else 
    EmgRest = butterFilter(EmgMatrix);
    movement = 'Rest';
    Intensity = [];
end
    
save(convertCharsToStrings(strcat('Emg',movement,Intensity,'.mat')),convertCharsToStrings(strcat('Emg',movement,Intensity)));

end
