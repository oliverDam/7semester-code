
%%Radial:

ADR_AccelData30 = repelem(DR_AccelData30,20,1);
AFR_AccelData30 = repelem(FR_AccelData30,20,1);
ASR_AccelData30 = repelem(SR_AccelData30,20,1);

ADR_AccelData50 = repelem(DR_AccelData50,20,1);
AFR_AccelData50 = repelem(FR_AccelData50,20,1);
ASR_AccelData50 = repelem(SR_AccelData50,20,1);

ADR_AccelData80 = repelem(DR_AccelData80,20,1);
AFR_AccelData80 = repelem(FR_AccelData80,20,1);
ASR_AccelData80 = repelem(SR_AccelData80,20,1);

%Radial 30%:
A_radial30 = [ADR_AccelData30(801:1400,:); AFR_AccelData30(801:1400,:); ASR_AccelData30(801:1400,:)]

%Radial 50%:
A_radial50 = [ADR_AccelData50(801:1400,:); AFR_AccelData50(801:1400,:); ASR_AccelData50(801:1400,:)];

%Radial 80%:
A_radial80 = [ADR_AccelData80(801:1400,:); AFR_AccelData80(801:1400,:); ASR_AccelData80(801:1400,:)];

allA_Radial = [A_radial30; A_radial50; A_radial80];