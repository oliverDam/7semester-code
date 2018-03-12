function buildAll();

%Loads all the recorded data - format = [Extension; Flexion; Radial; Ulnar]
allData = loadAndFormat();

%Loads our MVC files
load('MVCExtension.mat');
load('MVCFlexion.mat');
load('MVCRadial.mat');
load('MVCUlnar.mat');

%A length we need later
L = length(allData)/4;

%Extracts MAV
allMav = featureExtractionMAV(allData);

%Creates the class label names for the classifier
moveLabel = repelem(['Extension';'Flexion';'Radial';'Ulnar'], L, 1);

%Finds the intensities of the movements (the intensity shown in trapezoid)
ExtensionIntensity = movementIntensity(allData(1:L,:),MVCExtension);
FlexionIntensity = movementIntensity(allData(L+1:2*L,:),MVCFlexion);
RadialIntensity = movementIntensity(allData(2*L+1:3*L,:),MVCRadial);
UlnarIntensity = movementIntensity(allData(3*L+1:4*L,:),MVCUlnar);

%Creates the classifier
MdlLinear = fitcdiscr(allMav,moveLabel,'DiscrimType','quadratic', ... 
    'ScoreTransform','none','HyperparameterOptimizationOptions','bayesopt')

%Creates the regression models
ExtensionRegression = createRegression(allMav(1:L,:),allMav(L+1:2*L,:), ... 
    allMav(2*L+1:3*L,:), allMav(3*L+1:4*L,:), rest, ExtensionIntensity);

FlexionRegression = createRegression(allMav(L+1:2*L,:), allMav(2*L+1:3*L,:), ... 
    allMav(3*L+1:4*L,:), allMav(1:L,:), rest, FlexionIntensity);

RadialRegression = createRegression(allMav(2*L+1:3*L,:), allMav(3*L+1:4*L,:), ...
    allMav(1:L,:), allMav(L+1:2*L,:), rest, RadialIntensity);

UlnarRegression = createRegression(allMav(3*L+1:4*L,:), allMav(1:L,:), ... 
    allMav(L+1:2*L,:), allMav(2*L+1:3*L,:), rest, UlnarIntensity);

%Saves all the new things:
save('ExtensionRegression.mat','ExtensionRegression');
save('FlexionRegression.mat','FlexionRegression');
save('RadialRegression.mat','RadialRegression');
save('UlnarRegression.mat','UlnarRegression');
save('MdlLinear.mat','MdlLinear');
save('allData.mat','allData');
save('allMav.mat','allMav');