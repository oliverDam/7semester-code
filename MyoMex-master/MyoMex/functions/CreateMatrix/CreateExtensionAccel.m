
%%Extension:

ADE_AccelData30 = repelem(DE_AccelData30,20,1);
AFE_AccelData30 = repelem(FE_AccelData30,20,1);
ASE_AccelData30 = repelem(SE_AccelData30,20,1);

ADE_AccelData50 = repelem(DE_AccelData50,20,1);
AFE_AccelData50 = repelem(FE_AccelData50,20,1);
ASE_AccelData50 = repelem(SE_AccelData50,20,1);

ADE_AccelData80 = repelem(DE_AccelData80,20,1);
AFE_AccelData80 = repelem(FE_AccelData80,20,1);
ASE_AccelData80 = repelem(SE_AccelData80,20,1);

%Extension 30%:
A_extension30 = [ADE_AccelData30(801:1400,:); AFE_AccelData30(801:1400,:); ASE_AccelData30(801:1400,:)]

%Extension 50%:
A_extension50 = [ADE_AccelData50(801:1400,:); AFE_AccelData50(801:1400,:); ASE_AccelData50(801:1400,:)];

%Extension 80%:
A_extension80 = [ADE_AccelData80(801:1400,:); AFE_AccelData80(801:1400,:); ASE_AccelData80(801:1400,:)];

allA_Extension = [A_extension30; A_extension50; A_extension80];