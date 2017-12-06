k1 = featureExtractionMAV(allE_Extension(1:600,:));
k2 = featureExtractionMAV(allE_Extension(601:1200,:));
k3 = featureExtractionMAV(allE_Extension(1201:1800,:));

allMav_Extension = [k1;k2;k3];

k1 = featureExtractionMAV(allE_Flexion(1:600,:));
k2 = featureExtractionMAV(allE_Flexion(601:1200,:));
k3 = featureExtractionMAV(allE_Flexion(1201:1800,:));

allMav_Flexion = [k1;k2;k3];

k1 = featureExtractionMAV(allE_Radial(1:600,:));
k2 = featureExtractionMAV(allE_Radial(601:1200,:));
k3 = featureExtractionMAV(allE_Radial(1201:1800,:));

allMav_Radial = [k1;k2;k3];

k1 = featureExtractionMAV(allE_Ulnar(1:600,:));
k2 = featureExtractionMAV(allE_Ulnar(601:1200,:));
k3 = featureExtractionMAV(allE_Ulnar(1201:1800,:));

allMav_Ulnar = [k1;k2;k3];