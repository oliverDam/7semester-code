k1 = featureExtractionMove(allE_Extension(1:600,:),DE_MVC);
k2 = featureExtractionMove(allE_Extension(601:1200,:),FE_MVC);
k3 = featureExtractionMove(allE_Extension(1201:1800,:),SE_MVC);
k4 = featureExtractionMove(allE_Extension(1801:2400,:),DE_MVC);
k5 = featureExtractionMove(allE_Extension(2401:3000,:),FE_MVC);
k6 = featureExtractionMove(allE_Extension(3001:3600,:),SE_MVC);
k7 = featureExtractionMove(allE_Extension(3601:4200,:),DE_MVC);
k8 = featureExtractionMove(allE_Extension(4201:4800,:),FE_MVC);
k9 = featureExtractionMove(allE_Extension(4801:5400,:),SE_MVC);

allMove_Extension = [k1;k2;k3;k4;k5;k6;k7;k8;k9];

k1 = featureExtractionMove(allE_Flexion(1:600,:),DF_MVC);
k2 = featureExtractionMove(allE_Flexion(601:1200,:),FF_MVC);
k3 = featureExtractionMove(allE_Flexion(1201:1800,:),SF_MVC);
k4 = featureExtractionMove(allE_Flexion(1801:2400,:),DF_MVC);
k5 = featureExtractionMove(allE_Flexion(2401:3000,:),FF_MVC);
k6 = featureExtractionMove(allE_Flexion(3001:3600,:),SF_MVC);
k7 = featureExtractionMove(allE_Flexion(3601:4200,:),DF_MVC);
k8 = featureExtractionMove(allE_Flexion(4201:4800,:),FF_MVC);
k9 = featureExtractionMove(allE_Flexion(4801:5400,:),SF_MVC);

allMove_Flexion = [k1;k2;k3;k4;k5;k6;k7;k8;k9];

k1 = featureExtractionMove(allE_Radial(1:600,:),DR_MVC);
k2 = featureExtractionMove(allE_Radial(601:1200,:),FR_MVC);
k3 = featureExtractionMove(allE_Radial(1201:1800,:),SR_MVC);
k4 = featureExtractionMove(allE_Radial(1801:2400,:),DR_MVC);
k5 = featureExtractionMove(allE_Radial(2401:3000,:),FR_MVC);
k6 = featureExtractionMove(allE_Radial(3001:3600,:),SR_MVC);
k7 = featureExtractionMove(allE_Radial(3601:4200,:),DR_MVC);
k8 = featureExtractionMove(allE_Radial(4201:4800,:),FR_MVC);
k9 = featureExtractionMove(allE_Radial(4801:5400,:),SR_MVC);

allMove_Radial = [k1;k2;k3;k4;k5;k6;k7;k8;k9];

k1 = featureExtractionMove(allE_Ulnar(1:600,:),DU_MVC);
k2 = featureExtractionMove(allE_Ulnar(601:1200,:),FU_MVC);
k3 = featureExtractionMove(allE_Ulnar(1201:1800,:),SU_MVC);
k4 = featureExtractionMove(allE_Ulnar(1801:2400,:),DU_MVC);
k5 = featureExtractionMove(allE_Ulnar(2401:3000,:),FU_MVC);
k6 = featureExtractionMove(allE_Ulnar(3001:3600,:),SU_MVC);
k7 = featureExtractionMove(allE_Ulnar(3601:4200,:),DU_MVC);
k8 = featureExtractionMove(allE_Ulnar(4201:4800,:),FU_MVC);
k9 = featureExtractionMove(allE_Ulnar(4801:5400,:),SU_MVC);

allMove_Ulnar = [k1;k2;k3;k4;k5;k6;k7;k8;k9];