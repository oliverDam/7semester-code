function getRmsePlot(RMSEMav,RMSELogVar)

std_Mav = std(RMSEMav);
std_Log = std(RMSELogVar);

mean_Mav = mean(RMSEMav);
mean_Log = mean(RMSELogVar);

std_matrix = [std_Mav(1) std_Log(1) std_Mav(2) std_Log(2) std_Mav(3)...
    std_Log(3) std_Mav(4) std_Log(4)]

mean_matrix = [mean_Mav(1) mean_Log(1) mean_Mav(2) mean_Log(2) ...
    mean_Mav(3) mean_Log(3) mean_Mav(4) mean_Log(4)]


figure;
hold on;
bar(1:8,mean_matrix);
errorbar(1:8,mean_matrix,std_matrix,'.');
somenames = {'','Extension MAV','Extension LogVar','Flexion MAV','Flexion LogVar',...
    'Radial MAV','Radial LogVar','Ulnar MAV','Ulnar LogVar','',''};
set(gca,'xticklabel',somenames);