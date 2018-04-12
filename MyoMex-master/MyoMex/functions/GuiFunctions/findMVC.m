% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function findMVC(handles, handles2, handles3, m1, doWhat, movementType)

%Pause for initialization or something:
pause(0.1);
    
%Setup of the trapezoid:
if doWhat == 0
    x = [0 2000 4000 7000 9000 15000];
    y = [0.5, 0.5, 0.5, 0.5, 0.5 0.5];
elseif doWhat == 1
    x = [0 2000 4000 7000 9000 15000];
    y = [0.01, 0.01, 0.01, 0.01, 0.01 0.01];
end

%Required setup. Do NOT touch unless you want to screw every single thing
%in the entire program up!
plothandle = handles;
plothandle2 = handles2;
plothandle3 = handles3;
axes(plothandle2);
set(gca,'Color',[0.94 0.94 0.94]);
ax = gca
ax.Visible = 'off'
axes(plothandle3);
set(gca,'Color',[0.94 0.94 0.94]);
ax = gca
ax.Visible = 'off'

if ~isempty(plothandle);
    cla();
    plot(plothandle,x,y,'r');
    hold on;
    plot(plothandle,[0 0],[0 1],'w');
        
    %A little more of the setup. You're not allowed to touch this either!
    recordingTime = 15;
    buffer = 0;
    time = 0;
    lol = plot(0,0);
    windowSize = 40;
    MVC = 0;
    maxEmgMatrix = [];
    
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
                maxEmgMatrix = [maxEmgMatrix;meanAbs];
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
hold off;
%baseline = mean(dataMatrix(0:2000,1:8))


%% Something with the name of the variables we're going to save:
if doWhat == 0;
    if movementType == 1
        MVCFlexion = mean(maxEmgMatrix(75:110,:));
        movement = 'Flexion';
    elseif movementType == 2
        MVCExtension = mean(maxEmgMatrix(75:110,:));
        movement = 'Extension';
    elseif movementType == 3
        MVCRadial = mean(maxEmgMatrix(75:110,:));
        movement = 'Radial';
    elseif movementType == 4
        MVCUlnar = mean(maxEmgMatrix(75:110,:));
        movement = 'Ulnar';
    elseif movementType == 5
        MVCFist = mean(maxEmgMatrix(75:110,:));
        movement = 'Fist';
    elseif movementType == 6
        MVCStretch = mean(maxEmgMatrix(75:110,:));
        movement = 'Stretch';
    end

    Name1 = convertCharsToStrings(strcat('MVC',movement,'.mat'));
    Name2 = convertCharsToStrings(strcat('MVC',movement));

    save(Name1,Name2);
    
elseif doWhat == 1;
    baseline = mean(dataMatrix);
    save('baseline.mat','baseline');
end
