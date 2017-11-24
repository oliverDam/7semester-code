function getRmsePlot(RMSEMav,RMSELogVar)

std_Mav = std(RMSEMav);
std_Log = std(RMSELogVar);

mean_Mav = mean(RMSEMav);
mean_Log = mean(RMSELogVar);

std_matrix = [std_Mav, std_Log]

mean_matrix = [mean_Mav, mean_Log]


figure;
hold on;
bar(1:8,mean_matrix);
errorbar(1:8,mean_matrix,std_matrix,'.');
somenames = {'','Extension MAV','Flexion MAV','Radial MAV','Ulnar MAV', ...
    'Extension LogVar','Flexion LogVar','Radial LogVar','Ulnar LogVar','',''};
set(gca,'xticklabel',somenames);
ylabel('Error')