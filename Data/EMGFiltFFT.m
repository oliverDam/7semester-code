
%% Takes a ?x8 matrix input, performs FFT and butterworth
%  plots both to compare before and after filtering. 

%% You'll need to use removeAndSplit on the data before filtering!!

function EMGFiltFFT(emgData)

%% Splitting into columns

emgData1 = emgData([1],:);
emgData2 = emgData([2],:);
emgData3 = emgData([3],:);
emgData4 = emgData([4],:);
emgData5 = emgData([5],:);
emgData6 = emgData([6],:);
emgData7 = emgData([7],:);
emgData8 = emgData([8],:);

%% Doing some fft-ish things:

N = length(emgData1);
Fs = 200;
freq = (0:N-1)/N*Fs;

fftEmg1 = abs(fft(emgData1));
fftEmg2 = abs(fft(emgData2));
fftEmg3 = abs(fft(emgData3));
fftEmg4 = abs(fft(emgData4));
fftEmg5 = abs(fft(emgData5));
fftEmg6 = abs(fft(emgData6));
fftEmg7 = abs(fft(emgData7));
fftEmg8 = abs(fft(emgData8));

%% Plot all them fft's:

figure;
hold on;
subplot(2,4,1);
title('FFT of raw EMG - all channels');
plot(freq,fftEmg1);
xlim([0 100]);
subplot(2,4,2);
plot(freq,fftEmg2);
xlim([0 100]);
subplot(2,4,3);
plot(freq,fftEmg3);
xlim([0 100]);
subplot(2,4,4);
plot(freq,fftEmg4);
xlim([0 100]);
subplot(2,4,5);
plot(freq,fftEmg5);
xlim([0 100]);
subplot(2,4,6);
plot(freq,fftEmg6);
xlim([0 100]);
subplot(2,4,7);
plot(freq,fftEmg7);
xlim([0 100]);
subplot(2,4,8);
plot(freq,fftEmg8);
xlim([0 100]);
hold off;


%% Doing some butt-filter:

[b,a] = butter(2,0.05,'high');

filterEmg1 = filtfilt(b,a,emgData1);
filterEmg2 = filtfilt(b,a,emgData2);
filterEmg3 = filtfilt(b,a,emgData3);
filterEmg4 = filtfilt(b,a,emgData4);
filterEmg5 = filtfilt(b,a,emgData5);
filterEmg6 = filtfilt(b,a,emgData6);
filterEmg7 = filtfilt(b,a,emgData7);
filterEmg8 = filtfilt(b,a,emgData8);

%% Plotter butt-filteret:
figure;
hold on;
subplot(2,4,1);
plot(freq,abs(fft(filterEmg1)));
title('Butterworth and FFT - all channels');
xlim([0 100]);
subplot(2,4,2);
plot(freq,abs(fft(filterEmg2)));
xlim([0 100]);
subplot(2,4,3);
plot(freq,abs(fft(filterEmg3)));
xlim([0 100]);
subplot(2,4,4);
plot(freq,abs(fft(filterEmg4)));
xlim([0 100]);
subplot(2,4,5);
plot(freq,abs(fft(filterEmg5)));
xlim([0 100]);
subplot(2,4,6);
plot(freq,abs(fft(filterEmg6)));
xlim([0 100]);
subplot(2,4,7);
plot(freq,abs(fft(filterEmg7)));
xlim([0 100]);
subplot(2,4,8);
plot(freq,abs(fft(filterEmg8)));
xlim([0 100]);
hold off;

%% Plotter de forskellige kanaler:


figure;
axes('Position' , [0.05 -0.92 1 1], 'Visible' , 'off')
text(0.45,0.95,'Tid (s)')
h = text(0.03,1.3, 'Raw EMG - all channels')
set(h, 'rotation', 90)
hold on;
subplot(2,4,1);
plot(emgData1);
subplot(2,4,2);
plot(emgData2);
subplot(2,4,3);
plot(emgData3);
subplot(2,4,4);
plot(emgData4);
subplot(2,4,5);
plot(emgData5);
subplot(2,4,6);
plot(emgData6);
subplot(2,4,7);
plot(emgData7);
subplot(2,4,8);
plot(emgData8);
hold off;


%% Next step is to compare different data, which will be done in another
%  script due to the input variables in this script.


