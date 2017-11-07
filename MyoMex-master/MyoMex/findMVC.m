function findMVC(handles, m1)

    % gets the value from the slider (value is 1 to 10)
    pause(0.1);
    plothandle = handles;
    if ~isempty(plothandle);
        cla();
        hold on;
        axes(plothandle);
        
        %Gets the time we want to record:
        %recordingTime = str2double(get(handles.edit1))*1000;
        recordingTime = 10;
%         previousSample = 0;
        itsTime = 0;
        maxEmg = 0;
%         i = 1;
        time = 0;
        lol = plot(0,0);
        
        
            while time <= recordingTime
                
                timeEMG = m1.timeEMG_log;
                    if ~isempty(timeEMG)
                        iiEMG = find(timeEMG>=(timeEMG(end)-2));
                        tEMG = timeEMG(iiEMG);
                        MVC(iiEMG,:) = m1.emg_log(iiEMG,:);
                        maxEmg = max(mean(abs(MVC(iiEMG,:))))+maxEmg;
                        time = m1.timeEMG;
                        itsTime = itsTime+1;
                        if itsTime >= 20;
                            delete(lol);
                            maxEmg = maxEmg/itsTime
                            lol = plot(time*1000, maxEmg, 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'g')
                            drawnow;
                            itsTime = 0;
                            maxEmg = 0;
                        else
                            continue;
                        end
                    end

                end
    end
    save('MVC.mat','MVC');
end