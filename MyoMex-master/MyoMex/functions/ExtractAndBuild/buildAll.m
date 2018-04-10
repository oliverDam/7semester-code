function buildAll()

%Loads all the recorded data - format = [Extension; Flexion; Radial; Ulnar]
allData = loadAndFormat();

%Loads our MVC files
load('MVCExtension.mat');
load('MVCFlexion.mat');
load('MVCRadial.mat');
load('MVCUlnar.mat');
load('MVCFist.mat');
load('MVCStretch.mat');
load('EmgRest.mat');


%Extracts features:
allMav = featureExtractionMAV(allData);
allSSC = featureExtractionSSC(allData);
allWL = featureExtractionWL(allData);
allZC = featureExtractionZC(allData);
restMav = featureExtractionMAV(EmgRest(1001:4000,:));
restSSC = featureExtractionSSC(EmgRest(1001:4000,:));
restWL = featureExtractionWL(EmgRest(1001:4000,:));
restZC = featureExtractionZC(EmgRest(1001:4000,:));
L = length(allMav)/6;

%Creates the class label names for the classifier
moveLabel = [repelem({'Extension';'Flexion';'Radial';'Ulnar';'Fist';'Stretch';'Rest'}, L, 1)];

%Finds the intensities of the movements (the intensity shown in trapezoid)
ExtensionIntensity = featureExtractionMove(allMav(1:L,:),MVCExtension);
FlexionIntensity = featureExtractionMove(allMav(L+1:2*L,:),MVCFlexion);
RadialIntensity = featureExtractionMove(allMav(2*L+1:3*L,:),MVCRadial);
UlnarIntensity = featureExtractionMove(allMav(3*L+1:4*L,:),MVCUlnar);
FistIntensity = featureExtractionMove(allMav(4*L+1:5*L,:),MVCRadial);
StretchIntensity = featureExtractionMove(allMav(5*L+1:6*L,:),MVCUlnar);

%classInput = [allMav,allWL;restMav,restWL];
classInput = [allMav,allSSC,allWL,allZC;restMav,restSSC,restWL,restZC];

%Creates the classifier
MdlLinear = fitcdiscr(classInput,moveLabel,'DiscrimType','pseudolinear', ... 
    'ScoreTransform','none','HyperparameterOptimizationOptions','bayesopt')

%Creates the regression models
ExtensionRegression = createRegressionModel(allMav(1:L,:),allMav(L+1:2*L,:), ... 
    allMav(2*L+1:3*L,:), allMav(3*L+1:4*L,:), allMav(4*L+1:5*L,:), allMav(5*L+1:6*L,:), restMav, ExtensionIntensity);

FlexionRegression = createRegressionModel(allMav(L+1:2*L,:), allMav(2*L+1:3*L,:), ... 
    allMav(3*L+1:4*L,:), allMav(4*L+1:5*L,:), allMav(5*L+1:6*L,:), allMav(1:L,:), restMav, FlexionIntensity);

RadialRegression = createRegressionModel(allMav(2*L+1:3*L,:), allMav(3*L+1:4*L,:), ...
    allMav(4*L+1:5*L,:), allMav(5*L+1:6*L,:), allMav(1:L,:), allMav(L+1:2*L,:), restMav, RadialIntensity);

UlnarRegression = createRegressionModel(allMav(3*L+1:4*L,:), allMav(4*L+1:5*L,:), allMav(5*L+1:6*L,:), allMav(1:L,:), ... 
    allMav(L+1:2*L,:), allMav(2*L+1:3*L,:), restMav, UlnarIntensity);

FistRegression = createRegressionModel(allMav(4*L+1:5*L,:), allMav(5*L+1:6*L,:), allMav(1:L,:), ... 
    allMav(L+1:2*L,:), allMav(2*L+1:3*L,:), allMav(3*L+1:4*L,:), restMav, FistIntensity);

StretchRegression = createRegressionModel(allMav(5*L+1:6*L,:), allMav(1:L,:), ... 
    allMav(L+1:2*L,:), allMav(2*L+1:3*L,:), allMav(3*L+1:4*L,:), allMav(4*L+1:5*L,:), restMav, StretchIntensity);

%Saves all the new things:
save('ExtensionRegression.mat','ExtensionRegression');
save('FlexionRegression.mat','FlexionRegression');
save('RadialRegression.mat','RadialRegression');
save('UlnarRegression.mat','UlnarRegression');
save('FistRegression.mat','FistRegression');
save('StretchRegression.mat','StretchRegression');
save('MdlLinear.mat','MdlLinear');
save('allData.mat','allData');
save('allMav.mat','allMav');
save('allSSC.mat','allSSC');
save('allWL.mat','allWL');
save('allZC.mat','allZC');
save('restMav.mat','restMav');
save('restWL.mat','restWL');