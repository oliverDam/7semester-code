function plotMovingDot(Data, curSample)

% defines the length of the plot + the line we want to plot
N = length(Data);

figure;
% This is the graph that stays in the plot - the thing to follow when
% training the different movements. This should be changed to fit something
plot([0 500 1000 3000 4000], [0.05 0.05 0.8 0.8 0.5], 'c');
hold on;

% This plots the data as a dot flying around everywhere - it's completely
% chaotic at the moment, which is awesome... but impractical

    lol = plot(curSample, Data(curSample), 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'g')
    axis([0 N 0 1]);
    pause(0.001)
    delete(lol)