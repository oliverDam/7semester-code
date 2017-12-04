
function [output] = superPosition(output1,output2,output3,output4,move1,move2,move3,move4) 

Exte = mean([output1(:,1), output2(:,1), output3(:,1), output4(:,1)],2);
Flex = mean([output1(:,2), output2(:,2), output3(:,2), output4(:,2)],2);
Radi = mean([output1(:,3), output2(:,3), output3(:,3), output4(:,3)],2);
Ulna = mean([output1(:,4), output2(:,4), output3(:,4), output4(:,4)],2);

move = mean([move1, move2, move3, move4],2);

figure;
plot(smooth(Exte),'k')
hold on;
plot(smooth(Flex),'b')
plot(smooth(Radi),'g')
plot(smooth(Ulna),'m')
plot(smooth(move),'r')
legend('Predicted Extension','Predicted Flexion','Predicted Radial Deviation','Predicted Ulnar Deviation','Expected Output')
y1 = get(gca,'ylim');
plot([length(Flex)/4 length(Flex)/4], [-0.4 1],'k')
plot([length(Flex)/2 length(Flex)/2], [-0.4 1],'k')
plot([length(Flex)/4*3 length(Flex)/4*3], [-0.4 1],'k')
ylabel('Intensity of movement')
title('Superimposition of new data onto expected output of LogVar regressor')
xlim([0 length(Flex)]);

output = [Exte,Flex,Radi,Ulna,move]

% figure;
% right = [Exte(1:270,:); Flex(271:540,:); Radi(541:810,:); Ulna(811:1080,:)];
% plot(smooth(right),'b')
% hold on;
% plot(smooth(move),'r')
% legend('Predicted Value','Expected Output');
% plot([length(Flex)/4 length(Flex)/4], [-0.4 1],'k')
% plot([length(Flex)/2 length(Flex)/2], [-0.4 1],'k')
% plot([length(Flex)/4*3 length(Flex)/4*3], [-0.4 1],'k')