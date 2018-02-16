% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function findMVC(handles, m1, doWhat, movementType)

%Pause for initialization or something:
pause(0.1);
    
%Setup of the trapezoid:
if doWhat == 0
    x = [0 2000 4000 7000 9000 10000];
    y = [0.01, 0.01, 0.9, 0.9, 0.01 0.01];
elseif doWhat == 1
    x = [0 2000 4000 7000 9000 10000];
    y = [0.01, 0.01, 0.01, 0.01, 0.01 0.01];
end

%Required setup. Do NOT touch unless you want to screw every single thing
%in the entire program up!
plothandle = handles;
if ~isempty(plothandle);
    cla();
    hold on;
    axes(plothandle);
    plot(x,y);
        
    %A little more of the setup. You're not allowed to touch this either!
    recordingTime = 10;
    buffer = 0;
    time = 0;
    lol = plot(0,0);
    windowSize = 40;
    MVC = 0;
    
    %Makes sure we're recording for 'recordingTime' seconds:
    while time <= recordingTime
        
        %The following lines collects the data (code stolen from MyoMex)
        timeEMG = m1.timeEMG_log;
        if ~isempty(timeEMG)
            iiEMG = find(timeEMG>=(timeEMG(end)-2));
            tEMG = timeEMG(iiEMG);
            dataMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
            lastSample = max(iiEMG);
            %max(dataMatrix(iiEMG,:))
            
            %Creates a window with the size 'windowSize', in order to
            %split it into something which we can filter in real time. This
            %doesn't provide any overlap in the data.
            if lastSample >= windowSize && buffer >= windowSize
                time = m1.timeEMG;
                toBeFiltered = dataMatrix(lastSample-(windowSize-1):...
                    lastSample,1:8);
                filterEmg = butterFilter(toBeFiltered);
                
                %I'm not completely sure about the following lines, since
                %i was a bit too tired when i wrote them. Figure it out
                %guys!
                meanAbs = mean(abs(filterEmg));
                maxEmgMatrix(lastSample,:) = meanAbs;
                maxEmg = max(meanAbs);
                %MVC(lastSample) = maxEmg;
                
                %This plots the dot, and it works as it should
                axes(plothandle);
                delete(lol);
                lol = plot(time*1000, maxEmg, 'or', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
                drawnow;
                buffer = 0;
            else
                buffer = buffer + 1;
            end
        end
    end
end
baseline = mean(dataMatrix);
%baseline = mean(dataMatrix(0:2000,1:8))


%% Something with the name of the variables we're going to save:
if doWhat == 0;
    if movementType == 1
        MVCFlexion = findMVCvector(maxEmgMatrix);
        movement = 'Flexion';
    elseif movementType == 2
        MVCExtension = findMVCvector(maxEmgMatrix);
        movement = 'Extension';
    elseif movementType == 3
        MVCRadial = findMVCvector(maxEmgMatrix);
        movement = 'Radial';
    else
        MVCUlnar = findMVCvector(maxEmgMatrix);
        movement = 'Ulnar';
    end

    Name1 = convertCharsToStrings(strcat('MVC',movement,'.mat'));
    Name2 = convertCharsToStrings(strcat('MVC',movement));

    save(Name1,Name2);
    
elseif doWhat == 1;
    save('baseline.mat','baseline');
end
