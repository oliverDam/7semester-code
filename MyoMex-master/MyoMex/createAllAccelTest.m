start = 801;
ending = 1400;

DE_Test = repelem(DE_Test50,20,1);
FE_Test = repelem(FE_Test50,20,1);
SE_Test = repelem(SE_Test50,20,1);

DF_Test = repelem(DF_Test50,20,1);
FF_Test = repelem(FF_Test50,20,1);
SF_Test = repelem(SF_Test50,20,1);

DU_Test = repelem(DU_Test50,20,1);
FU_Test = repelem(FU_Test50,20,1);
SU_Test = repelem(SU_Test50,20,1);

DR_Test = repelem(DR_Test50,20,1);
FR_Test = repelem(FR_Test50,20,1);
SR_Test = repelem(SR_Test50,20,1);

allA_Extension = [DE_Test(start:ending,:); FE_Test(start:ending,:); SE_Test(start:ending,:)];
save('allA_Extension.mat','allA_Extension');

allA_Flexion = [DF_Test(start:ending,:); FF_Test(start:ending,:); SF_Test(start:ending,:)];
save('allA_Flexion.mat','allA_Flexion');

allA_Ulnar = [DU_Test(start:ending,:); FU_Test(start:ending,:); SU_Test(start:ending,:)];

save('allA_Ulnar','allA_Ulnar')

allA_Radial = [DR_Test(start:ending,:); FR_Test(start:ending,:); SR_Test(start:ending,:)];

save('allA_Radial','allA_Radial')