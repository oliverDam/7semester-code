function buildAll();

%Loads all the recorded data - format = [Extension; Flexion; Radial; Ulnar]
allData = loadAndFormat();

%Loads our MVC files
load('MVCExtension.mat');
load('MVCFlexion.mat');
load('MVCRadial.mat');
load('MVCUlnar.mat');
load('EmgRest.mat');

%A length we need later
L = length(allData)/4;

%Extracts MAV
allMav = featureExtractionMAV(allData);
Rest = featureExtractionMAV(EmgRest(1001:2000,:));
L2 = length(allMav)/4;

%Creates the class label names for the classifier
moveLabel = repelem({'Extension';'Flexion';'Radial';'Ulnar'}, L, 1);
moveLabelMav = repelem({'Extension';'Flexion';'Radial';'Ulnar'}, L2, 1);

%Finds the intensities of the movements (the intensity shown in trapezoid)
ExtensionIntensity = featureExtractionMove(allMav(1:L2,:),MVCExtension);
FlexionIntensity = featureExtractionMove(allMav(L2+1:2*L2,:),MVCFlexion);
RadialIntensity = featureExtractionMove(allMav(2*L2+1:3*L2,:),MVCRadial);
UlnarIntensity = featureExtractionMove(allMav(3*L2+1:4*L2,:),MVCUlnar);

%Creates the classifier
%MdlLinear = fitcdiscr(allMav,moveLabelMav,'DiscrimType','linear', ... 
%    'ScoreTransform','none','HyperparameterOptimizationOptions','bayesopt')
MdlLinearExtFle = fitcdiscr(allMav(1:L2*2,:),moveLabelMav(1:L2*2,:),'DiscrimType','linear', ... 
    'ScoreTransform','none','HyperparameterOptimizationOptions','bayesopt')
MdlLinearRadUln = fitcdiscr(allMav(2*L2+1:L2*4,:),moveLabelMav(2*L2+1:L2*4,:),'DiscrimType','linear', ... 
    'ScoreTransform','none','HyperparameterOptimizationOptions','bayesopt')

%Creates the regression models
ExtensionRegression = createRegressionModel(allMav(1:L2,:),allMav(L2+1:2*L2,:), ... 
    allMav(2*L2+1:3*L2,:), allMav(3*L2+1:4*L2,:), Rest, ExtensionIntensity);

FlexionRegression = createRegressionModel(allMav(L2+1:2*L2,:), allMav(2*L2+1:3*L2,:), ... 
    allMav(3*L2+1:4*L2,:), allMav(1:L2,:), Rest, FlexionIntensity);

RadialRegression = createRegressionModel(allMav(2*L2+1:3*L2,:), allMav(3*L2+1:4*L2,:), ...
    allMav(1:L2,:), allMav(L2+1:2*L2,:), Rest, RadialIntensity);

UlnarRegression = createRegressionModel(allMav(3*L2+1:4*L2,:), allMav(1:L2,:), ... 
    allMav(L2+1:2*L2,:), allMav(2*L2+1:3*L2,:), Rest, UlnarIntensity);

%Saves all the new things:
save('ExtensionRegression.mat','ExtensionRegression');
save('FlexionRegression.mat','FlexionRegression');
save('RadialRegression.mat','RadialRegression');
save('UlnarRegression.mat','UlnarRegression');
%save('MdlLinear.mat','MdlLinear');
save('MdlLinearExtFle.mat','MdlLinearExtFle');
save('MdlLinearRadUln.mat','MdlLinearRadUln');
save('allData.mat','allData');
save('allMav.mat','allMav');