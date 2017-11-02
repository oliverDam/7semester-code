function initDataExtraction

%% Pseudo-real-time EMG data extraction from Myo to MATLAB
% Extracts EMG data from a MYO to MATLAB via C++
% Requires MYO Connect to be running
% Runs a C++ executable in a command prompt

clear; clc; close all % House keep

%% Genmeral Setup
lineLength = 54;
numChannels = 8;
sampMax = 4000;
windowLength = 40;
curPosition = 0;

emgData = NaN([sampMax numChannels]); % Matrix for EMG data
mavData = NaN([(sampMax - windowLength) numChannels]); % Matrix for MAV feature

fileNameEMG = 'emg.txt'; % File for data transmission; again stop judging ^^
cmdWindowName = 'EMG Gather';

FileEMG = fopen(fileNameEMG,'w'); % Reset file
fclose(FileEMG); 

system(['start /realtime "' cmdWindowName '" getMyoEmg.exe & exit &']) % Start (non-blocking) C thread
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
fclose(FileEMG);
