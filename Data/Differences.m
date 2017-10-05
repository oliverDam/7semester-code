%% Compare data in order to find the specific signal properties for each
%  movement we've recorded. You'll have to use removeAndSplit(emgData)
%  before using this script!!

function Differences(emg1Data, emg2Data)

%% Rut-meen-skuar of the signal amplitude:

for i=1:8
    RMS1(i) = rms(emg1Data([i],:));
end

for i=1:8
    RMS2(i) = rms(emg2Data([i],:));
end

RMSCompMat = [RMS1; RMS2]

%% Something with the frequencies and fft. Take a look at the differences
%  between the frequencies of the signals?

for i=1:8
    fftEmg1(i) = rms(abs(fft(emg1Data([i],:))));
end

for i=1:8
    fftEmg2(i) = rms(abs(fft(emg2Data([i],:))));
end

RMSFFT = [fftEmg1; fftEmg2]



