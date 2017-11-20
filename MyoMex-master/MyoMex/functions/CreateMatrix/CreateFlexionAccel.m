
%%Flexion:

ADF_AccelData30 = repelem(DF_AccelData30,20,1);
AFF_AccelData30 = repelem(FF_AccelData30,20,1);
ASF_AccelData30 = repelem(SF_AccelData30,20,1);

ADF_AccelData50 = repelem(DF_AccelData50,20,1);
AFF_AccelData50 = repelem(FF_AccelData50,20,1);
ASF_AccelData50 = repelem(SF_AccelData50,20,1);

ADF_AccelData80 = repelem(DF_AccelData80,20,1);
AFF_AccelData80 = repelem(FF_AccelData80,20,1);
ASF_AccelData80 = repelem(SF_AccelData80,20,1);

%Flexion 30%:
A_flexion30 = [ADF_AccelData30(801:1400,:); AFF_AccelData30(801:1400,:); ASF_AccelData30(801:1400,:)]

%Flexion 50%:
A_flexion50 = [ADF_AccelData50(801:1400,:); AFF_AccelData50(801:1400,:); ASF_AccelData50(801:1400,:)];

%Flexion 80%:
A_flexion80 = [ADF_AccelData80(801:1400,:); AFF_AccelData80(801:1400,:); ASF_AccelData80(801:1400,:)];

allA_Flexion = [A_flexion30; A_flexion50; A_flexion80];