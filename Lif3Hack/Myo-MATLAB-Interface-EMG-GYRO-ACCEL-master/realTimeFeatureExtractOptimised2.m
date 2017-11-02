function realTimeFeatureExtractOptimised2

%% Pseudo-real-time EMG data extraction from Myo to MATLAB
% Extracts EMG data from a MYO to MATLAB via C++
% Requires MYO Connect to be running
% Runs a C++ executable in a command prompt

%% Genmeral Setup
lineLength = 54;
numChannels = 8;
sampMax = 4000;
windowLength = 40;
curPosition = 0;

% This we have tilfoejt:
sampSize = 20;

%% This we have tilfoejt:

    movVar = dsp.MovingVariance('Method','Sliding window', 'ForgettingFactor', 0.9); %Moving variance stuff
    logVarData = NaN([(sampMax - windowLength) numChannels]);

    emgData = NaN([sampMax numChannels]); % Matrix for EMG data
    mavData = NaN([(sampMax - windowLength) numChannels]); % Matrix for MAV feature

    fileNameEMG = 'emg.txt'; % File for data transmission; again stop judging ^^
    cmdWindowName = 'EMG Gather';

    FileEMG = fopen(fileNameEMG,'w'); % Reset file
    fclose(FileEMG); 

system(['start /realtime "' cmdWindowName '" getMyoEmg.exe & exit &']) % Start (non-blocking) C thread
figure(1) % Do after cmd call to bring to foreground
set(gcf,'currentchar',']') % Used for exit on button press

%% Pause for handshake with myo connect and for data collection to begin
pause(1);

%% Pseudo-realtime extraction
% Get first timestamp from file (and check data gathering is working)
FileEMG = fopen(fileNameEMG,'r'); 
fseek(FileEMG,curPosition,-1); 
fileDataRaw = fgetl(FileEMG);
if fileDataRaw == -1 
    system(['taskkill /f /fi "WindowTitle eq  ' cmdWindowName '" /T & exit']) 
    close(gcf)
    disp('Data acquisition not active')
    return;
end
fileDataStrArray = strsplit(fileDataRaw,',');
startTime = str2double(fileDataStrArray(end));
fclose(FileEMG);

curSample = 1;
lastSample = 1;

%This we have tilfoejt:
lastBuffer = 1;

while get(gcf,'currentchar')==']' % While no button has been pressed
    FileEMG = fopen(fileNameEMG,'r'); 
    fseek(FileEMG,curPosition,-1); 

    fileDataRaw = ' ';
    while ischar(fileDataRaw) % Extract new data from file
        fileDataRaw = fgetl(FileEMG);
        if numel(fileDataRaw) ~= lineLength % Break if last line incomplete (and seek back to start of that line
            fseek(FileEMG,-numel(fileDataRaw) ,0);
            break;
        end
        
        fileDataStrArray = strsplit(fileDataRaw,',');
        curTime = str2double(fileDataStrArray(end));
        emgData(curSample,:) = str2double(fileDataStrArray(1:numChannels));
        
        if curSample >= windowLength % MAV feature extraction
            mavData(curSample - windowLength + 1,:) = mean(abs(emgData(curSample - windowLength + 1:curSample,:)));
        end
        
        % the moving variance maybe with log also:
        logVarData = log(step(movVar, emgData));
        
        curSample = curSample + 1;
    end
    curPosition = ftell(FileEMG);
    fclose(FileEMG); 
    
    if curSample - lastSample == 0 % Don't waste time drawing if no new data
        continue;
    else
        lastSample = curSample;  
    end
    
    % This we have tilfoejt:
    if curSample - lastBuffer >= 20
        lastBuffer = curSample;
        dotThing(curSample) = processBuffer(emgData(curSample-20:curSample,:));
    else
        lol = 1;
    end
        
    % Plots
    subplot(3,1,1)
    plot(emgData)
    ylim([-128 127])
    xlim([1 sampMax])
    title(['Sample frequency: ' num2str(curSample/(curTime - startTime))])
    xlabel('Samples')
    ylabel('Amplitude')
    
    subplot(3,1,2)
    plot(mavData)
    ylim([0 127])
    xlim([1 sampMax])
    title([num2str(windowLength) ' Sample Window MAV'])
    xlabel('Press any key to quit..')
    ylabel('Amplitude')
    
    subplot(3,1,3)
    plot(logVarData)
    ylim([0 10])
    xlim([1 sampMax])
    title([num2str(windowLength) ' Sample Window variance'])
    xlabel('Press any key to quit..')
    ylabel('Amplitude')
    
    drawnow
    
    if curSample > sampMax % Clear arrays when large
        curSample = 1;
        lastSample = 1;
        lastBuffer = 1;
        emgData = NaN([sampMax numChannels]);
        mavData = NaN([(sampMax - windowLength) numChannels]);
        logVarData = NaN([(sampMax - windowLength) numChannels]);
        startTime = curTime;
    end
end
limit = limit+1;

%% CLean up - target specific window made for this script
system(['taskkill /f /fi "WindowTitle eq  ' cmdWindowName '" /T & exit']) 
close(gcf)

