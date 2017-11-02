function extractData

%% Some setup:

fileNameEMG = 'emg.txt'; % File for data transmission; again stop judging ^^
cmdWindowName = 'EMG Gather';

lineLength = 54;
numChannels = 8;
sampMax = 4000;
windowLength = 40;
curPosition = 0;

curSample = 1;
lastSample = 1;

figure(2);

%Timestampstuff:
FileEMG = fopen(fileNameEMG,'r'); 
fseek(FileEMG,curPosition,-1);
fileDataRaw = fgetl(FileEMG);
fileDataStrArray = strsplit(fileDataRaw,',');

startTime = str2double(fileDataStrArray(end));

%%The data getting stuff

while 1; % While no button has been pressed
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
        
        curSample = curSample + 1;
    end
    curPosition = ftell(FileEMG);
    fclose(FileEMG); 
    
    if curSample - lastSample == 0 % Don't waste time drawing if no new data
        continue;
    else
        lastSample = curSample;  
    end
    
    % Plots
    subplot(2,1,1)
    plot(emgData)
    ylim([-128 127])
    xlim([1 sampMax])
    title(['Sample frequency: ' num2str(curSample/(curTime - startTime))])
    xlabel('Samples')
    ylabel('Amplitude')
    
    subplot(2,1,2)
    plot(mavData)
    ylim([0 127])
    xlim([1 sampMax])
    title([num2str(windowLength) ' Sample Window MAV'])
    xlabel('Press any key to quit..')
    ylabel('Amplitude')
    drawnow
    
    if curSample > sampMax % Clear arrays when large
        curSample = 1;
        lastSample = 1;
        emgData = NaN([sampMax numChannels]);
        mavData = NaN([(sampMax - windowLength) numChannels]);
        startTime = curTime;
    end
end