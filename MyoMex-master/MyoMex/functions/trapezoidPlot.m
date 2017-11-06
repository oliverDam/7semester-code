% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(sliderValue, handles, m1, mm);

    % gets the value from the slider (value is 1 to 10)
    pause(0.1);
    x = [0 500 1000 3000 3800];
    y = [0.01, 0.01, sliderValue, sliderValue, 0.01];
    plothandle = handles;
    if ~isempty(plothandle);
        cla();
        hold on;
        axes(plothandle);
        plot(x,y);
        
        %Gets the time we want to record:
        %recordingTime = str2double(get(handles.edit1))*1000;
        recordingTime = 10;
        previousSample = 0;
        i = 1;
        time = 0;
        %Somehow this retrieves an array with 8 emg data stuffz in it
        %wrong:
            
        
            while time <= recordingTime
                emg = m1.emg;
                compareValue = emg;
                if previousSample(1,1) ~= compareValue(1,1) && ~isempty(emg)
                    dataMatrix(i,:) = emg;
                    avgEmg = mean(emg);
                    i = i+1;
                    time = m1.timeEMG;
                    previousSample = emg;
                else
                    continue;
                end
            end
                    
%             timeEMG = m1.timeEMG_log;
                
%                 if ~isempty(timeEMG) && i<=recordingTime
%                     iiEMG = find(timeEMG>=(timeEMG(end)));
%                     tEMG = timeEMG(iiEMG);
%                     e = m1.emg_log(iiEMG,:);
%                     emgData(i,:) = e
%                     avgEmg = mean(e)
%                     
%                 end
%                 i = i+1

    end
end
