k1 = featureExtractionLogVar(allE_Extension(1:600,:));
k2 = featureExtractionLogVar(allE_Extension(601:1200,:));
k3 = featureExtractionLogVar(allE_Extension(1201:1800,:));
k4 = featureExtractionLogVar(allE_Extension(1801:2400,:));
k5 = featureExtractionLogVar(allE_Extension(2401:3000,:));
k6 = featureExtractionLogVar(allE_Extension(3001:3600,:));
k7 = featureExtractionLogVar(allE_Extension(3601:4200,:));
k8 = featureExtractionLogVar(allE_Extension(4201:4800,:));
k9 = featureExtractionLogVar(allE_Extension(4801:5400,:));

allLogVar_Extension = [k1;k2;k3;k4;k5;k6;k7;k8;k9];

k1 = featureExtractionLogVar(allE_Flexion(1:600,:));
k2 = featureExtractionLogVar(allE_Flexion(601:1200,:));
k3 = featureExtractionLogVar(allE_Flexion(1201:1800,:));
k4 = featureExtractionLogVar(allE_Flexion(1801:2400,:));
k5 = featureExtractionLogVar(allE_Flexion(2401:3000,:));
k6 = featureExtractionLogVar(allE_Flexion(3001:3600,:));
k7 = featureExtractionLogVar(allE_Flexion(3601:4200,:));
k8 = featureExtractionLogVar(allE_Flexion(4201:4800,:));
k9 = featureExtractionLogVar(allE_Flexion(4801:5400,:));

allLogVar_Flexion = [k1;k2;k3;k4;k5;k6;k7;k8;k9];

k1 = featureExtractionLogVar(allE_Radial(1:600,:));
k2 = featureExtractionLogVar(allE_Radial(601:1200,:));
k3 = featureExtractionLogVar(allE_Radial(1201:1800,:));
k4 = featureExtractionLogVar(allE_Radial(1801:2400,:));
k5 = featureExtractionLogVar(allE_Radial(2401:3000,:));
k6 = featureExtractionLogVar(allE_Radial(3001:3600,:));
k7 = featureExtractionLogVar(allE_Radial(3601:4200,:));
k8 = featureExtractionLogVar(allE_Radial(4201:4800,:));
k9 = featureExtractionLogVar(allE_Radial(4801:5400,:));

allLogVar_Radial = [k1;k2;k3;k4;k5;k6;k7;k8;k9];

k1 = featureExtractionLogVar(allE_Ulnar(1:600,:));
k2 = featureExtractionLogVar(allE_Ulnar(601:1200,:));
k3 = featureExtractionLogVar(allE_Ulnar(1201:1800,:));
k4 = featureExtractionLogVar(allE_Ulnar(1801:2400,:));
k5 = featureExtractionLogVar(allE_Ulnar(2401:3000,:));
k6 = featureExtractionLogVar(allE_Ulnar(3001:3600,:));
k7 = featureExtractionLogVar(allE_Ulnar(3601:4200,:));
k8 = featureExtractionLogVar(allE_Ulnar(4201:4800,:));
k9 = featureExtractionLogVar(allE_Ulnar(4801:5400,:));

allLogVar_Ulnar = [k1;k2;k3;k4;k5;k6;k7;k8;k9];