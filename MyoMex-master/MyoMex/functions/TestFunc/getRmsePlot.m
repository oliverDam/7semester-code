function getRmsePlot(RMSEMav,RMSELogVar)

std_Mav = std(RMSEMav);
std_Log = std(RMSELogVar);

stdOverall_Mav = std(RMSEMav(:))
stdOverall_Log = std(RMSELogVar(:))

mean_Mav = mean(RMSEMav);
mean_Log = mean(RMSELogVar);

meanOverall_Mav = mean(RMSEMav(:))
meanOverall_Log = mean(RMSELogVar(:))

std_matrix = [std_Mav, stdOverall_Mav, std_Log, stdOverall_Log]

mean_matrix = [mean_Mav, meanOverall_Mav, mean_Log, meanOverall_Log]


figure;
hold on;
bar(1:10,mean_matrix);
errorbar(1:10,mean_matrix,std_matrix,'.');
somenames = {'','Extension MAV','Flexion MAV','Radial MAV','Ulnar MAV','Overall MAV', 'Extension LogVar','Flexion LogVar','Radial LogVar','Ulnar LogVar','Overall LogVar',''};
set(gca,'xticklabel',somenames);
ylabel('Error')