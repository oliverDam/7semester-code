%Input vs. output of regressor. Requires that you've got the regressors in
%your current folder to the left (<--). allData and allMove is a collection
%of the data for each movement and can be found in some folders! Meant to
%take a look at the y values we put in and compare them to the y values we
%get from the regressor:

function [output] = inputVersusOutput(allMove,allData)

load('ExtensionRegression.mat');
load('FlexionRegression.mat');
load('RadialRegression.mat');
load('UlnarRegression.mat');

flex1 = allData(:,1);
flex2 = allData(:,2);
flex3 = allData(:,3);
flex4 = allData(:,4);
flex5 = allData(:,5);
flex6 = allData(:,6);
flex7 = allData(:,7);
flex8 = allData(:,8);

ypredFlex = feval(mahFlexionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredExte = feval(mahExtensionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredRadi = feval(mahRadialRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredUlna = feval(mahUlnarRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);

plot(ypredExte,'k')
hold on;
plot(ypredFlex,'b')
plot(ypredRadi,'g')
plot(ypredUlna,'m')
plot(allMove,'r')

output = [ypredFlex;ypredExte;ypredRadi;ypredUlna]