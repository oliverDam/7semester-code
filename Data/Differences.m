%% Compare data in order to find the specific signal properties for each
%  movement we've recorded. You'll have to use removeAndSplit(emgData)
%  before using this script!!

function Differences(emg1Data, emg2Data)

%% Split into channels:

emg1Data1 = emg1Data([1],:)
emg1Data2 = emg1Data([2],:);
emg1Data3 = emg1Data([3],:);
emg1Data4 = emg1Data([4],:);
emg1Data5 = emg1Data([5],:);
emg1Data6 = emg1Data([6],:);
emg1Data7 = emg1Data([7],:);
emg1Data8 = emg1Data([8],:);

emg2Data1 = emg2Data([1],:)
emg2Data2 = emg2Data([2],:);
emg2Data3 = emg2Data([3],:);
emg2Data4 = emg2Data([4],:);
emg2Data5 = emg2Data([5],:);
emg2Data6 = emg2Data([6],:);
emg2Data7 = emg2Data([7],:);
emg2Data8 = emg2Data([8],:);

%% Rut-meen-skuar of the signal amplitude:

RMS11 = rms(emg1Data1);
RMS12 = rms(emg1Data2);
RMS13 = rms(emg1Data3);
RMS14 = rms(emg1Data4);
RMS15 = rms(emg1Data5);
RMS16 = rms(emg1Data6);
RMS17 = rms(emg1Data7);
RMS18 = rms(emg1Data8);

RMS21 = rms(emg2Data1);
RMS22 = rms(emg2Data2);
RMS23 = rms(emg2Data3);
RMS24 = rms(emg2Data4);
RMS25 = rms(emg2Data5);
RMS26 = rms(emg2Data6);
RMS27 = rms(emg2Data7);
RMS28 = rms(emg2Data8);

RMSCompMat = [RMS11 RMS12 RMS13 RMS14 RMS15 RMS16 RMS17 RMS18; RMS21 ...
    RMS22 RMS23 RMS24 RMS25 RMS26 RMS27 RMS28]

