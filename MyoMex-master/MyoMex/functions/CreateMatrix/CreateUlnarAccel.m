
%%Ulnar:

ADU_AccelData30 = repelem(DU_AccelData30,20,1);
AFU_AccelData30 = repelem(FU_AccelData30,20,1);
ASU_AccelData30 = repelem(SU_AccelData30,20,1);

ADU_AccelData50 = repelem(DU_AccelData50,20,1);
AFU_AccelData50 = repelem(FU_AccelData50,20,1);
ASU_AccelData50 = repelem(SU_AccelData50,20,1);

ADU_AccelData80 = repelem(DU_AccelData80,20,1);
AFU_AccelData80 = repelem(FU_AccelData80,20,1);
ASU_AccelData80 = repelem(SU_AccelData80,20,1);

%Ulnar 30%:
A_ulnar30 = [ADU_AccelData30(801:1400,:); AFU_AccelData30(801:1400,:); ASU_AccelData30(801:1400,:)]

%Ulnar 50%:
A_ulnar50 = [ADU_AccelData50(801:1400,:); AFU_AccelData50(801:1400,:); ASU_AccelData50(801:1400,:)];

%Ulnar 80%:
A_ulnar80 = [ADU_AccelData80(801:1400,:); AFU_AccelData80(801:1400,:); ASU_AccelData80(801:1400,:)];

allA_Ulnar = [A_ulnar30; A_ulnar50; A_ulnar80];