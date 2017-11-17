flex1 = flexion40(:,1)
flex2 = flexion40(:,2)
flex3 = flexion40(:,3)
flex4 = flexion40(:,4)
flex5 = flexion40(:,5)
flex6 = flexion40(:,6)
flex7 = flexion40(:,7)
flex8 = flexion40(:,8)


ypredFlex = feval(mahFlexionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredExte = feval(mahExtensionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredRadi = feval(mahRadialRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredUlna = feval(mahUlnarRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);

plot(ypredFlex,'c')
legend('Flexion')
hold on;
plot(ypredExte,'g')
plot(ypredRadi,'m')
plot(ypredUlna,'r')