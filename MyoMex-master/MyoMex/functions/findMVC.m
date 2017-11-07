% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(handles, m1)
        
    
    % gets the value from the slider (value is 1 to 10)
    pause(0.1);
    x = [0 2000 4000 8000 9000 10000];
    y = [0.01, 0.01, 0.9, 0.9, 0.01 0.01];
    plothandle = handles;
    if ~isempty(plothandle);
        cla();
        hold on;
        axes(plothandle);
        plot(x,y);
        
        %Gets the time we want to record:
        %recordingTime = str2double(get(handles.edit1))*1000;
        recordingTime = 10;
        buffer = 0;
        time = 0;
        lol = plot(0,0);
        windowSize = 40;
        MVC = 0;
        
        
            while time <= recordingTime
                
                timeEMG = m1.timeEMG_log;
                    if ~isempty(timeEMG)
                        iiEMG = find(timeEMG>=(timeEMG(end)-2));
                        tEMG = timeEMG(iiEMG);
                        dataMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
                        lastSample = max(iiEMG);
                        max(dataMatrix(iiEMG,:))
                        if lastSample >= windowSize && buffer >= windowSize
                            time = m1.timeEMG;
                            toBeFiltered = dataMatrix(lastSample-(windowSize-1):lastSample,1:8);
                            filterEmg = butterFilter(toBeFiltered);
                            meanAbs = mean(abs(filterEmg));
                            maxEmg = max(meanAbs);
                            MVC(lastSample) = maxEmg;
                            axes(plothandle);
                            delete(lol);
                            lol = plot(time*1000, maxEmg, 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'g');
                            drawnow;
                            buffer = 0;
                        else
                            buffer = buffer + 1;
                        end
                    end

                end
    end
    MVC = max(MVC);
    save('MVC.mat','MVC');
end
