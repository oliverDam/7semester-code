meanExtension = mean(allExtension');
meanFlexion = mean(allFlexion');
meanRadial = mean(allRadial');
meanUlnar = mean(allUlnar');

nedEx = [meanExtension(1:600)';meanExtension(1801:2400)';meanExtension(3601:4200)'];
opEx = [meanExtension(601:1200)';meanExtension(2401:3000)';meanExtension(4201:4800)'];
sideEx = [meanExtension(1201:1800)';meanExtension(3001:3600)';meanExtension(4801:5400)'];

nedExMov = [movementExtension(1:600);movementExtension(1801:2400);movementExtension(3601:4200)];
opExMov = [movementExtension(601:1200);movementExtension(2401:3000);movementExtension(4201:4800)];
sideExMov = [movementExtension(1201:1800);movementExtension(3001:3600);movementExtension(4801:5400)];

nedFlex = [meanFlexion(1:600)';meanFlexion(1801:2400)';meanFlexion(3601:4200)'];
opFlex = [meanFlexion(601:1200)';meanFlexion(2401:3000)';meanFlexion(4201:4800)'];
sideFlex = [meanFlexion(1201:1800)';meanFlexion(3001:3600)';meanFlexion(4801:5400)'];

nedFlexMov = [movementFlexion(1:600);movementFlexion(1801:2400);movementFlexion(3601:4200)];
opFlexMov = [movementFlexion(601:1200);movementFlexion(2401:3000);movementFlexion(4201:4800)];
sideFlexMov = [movementFlexion(1201:1800);movementFlexion(3001:3600);movementFlexion(4801:5400)];

nedRad = [meanRadial(1:600)';meanRadial(1801:2400)';meanRadial(3601:4200)'];
opRad = [meanRadial(601:1200)';meanRadial(2401:3000)';meanRadial(4201:4800)'];
sideRad = [meanRadial(1201:1800)';meanRadial(3001:3600)';meanRadial(4801:5400)'];

nedRadMov = [movementRadial(1:600);movementRadial(1801:2400);movementRadial(3601:4200)];
opRadMov = [movementRadial(601:1200);movementRadial(2401:3000);movementRadial(4201:4800)];
sideRadMov = [movementRadial(1201:1800);movementRadial(3001:3600);movementRadial(4801:5400)];

nedUl = [meanUlnar(1:600)';meanUlnar(1801:2400)';meanUlnar(3601:4200)'];
opUl = [meanUlnar(601:1200)';meanUlnar(2401:3000)';meanUlnar(4201:4800)'];
sideUl = [meanUlnar(1201:1800)';meanUlnar(3001:3600)';meanUlnar(4801:5400)'];

nedUlMov = [movementUlnar(1:600);movementUlnar(1801:2400);movementUlnar(3601:4200)];
opUlMov = [movementUlnar(601:1200);movementUlnar(2401:3000);movementUlnar(4201:4800)];
sideUlMov = [movementUlnar(1201:1800);movementUlnar(3001:3600);movementUlnar(4801:5400)];

figure(1)
scatter(nedExMov,nedEx,10,'filled','g')
hold on
scatter(opExMov,opEx,10,'filled','r')
scatter(sideExMov,sideEx,10,'filled','c')
xlabel('Normalized EMG intensity')
ylabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Extension')

figure(2)
scatter(nedFlexMov,nedFlex,10,'filled','g')
hold on
scatter(opFlexMov,opFlex,10,'filled','r')
scatter(sideFlexMov,sideFlex,10,'filled','c')
xlabel('Normalized EMG intensity')
ylabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Flexion')

figure(3)
scatter(nedRadMov,nedRad,10,'filled','g')
hold on
scatter(opRadMov,opRad,10,'filled','r')
scatter(sideRadMov,sideRad,10,'filled','c')
xlabel('Normalized EMG intensity')
ylabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Radial deviation')

figure(4)
scatter(nedUlMov,nedUl,10,'filled','g')
hold on
scatter(opUlMov,opUl,10,'filled','r')
scatter(sideUlMov,sideUl,10,'filled','c')
xlabel('Normalized EMG intensity')
ylabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Ulnar deviation')