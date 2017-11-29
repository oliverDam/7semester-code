plot(smooth(iGotMovez),'r')
hold on;
plot(smooth(iGotOutputz),'b')
plot(smooth(iGotOutputzMav),'g')
xlabel('Samples')
ylabel('Output intensity')
x1 = 271;
x2 = 270*2+1;
x3 = 270*3+1;
y1 = get(gca,'ylim');
plot([x1 x1], y1,'k');
plot([x2 x2], y1,'k');
plot([x3 x3], y1,'k');
xlim([0 1080])
legend('Expected output','Regressor output (LogVar)','Regressor output (MAV)')