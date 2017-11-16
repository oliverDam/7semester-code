
%%Extension:

K = 600;
F = 1;
L = 600;

%Extension 30%:
E_extension30(F:L,1:8) = DE_EmgData30(801:1400,:);
F = F+L;
L = L+L;
E_extension30(F:L,1:8) = FE_EmgData30(801:1400,:);
F = F+K;
L = L+K;
E_extension30(F:L,1:8) = SE_EmgData30(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Extension 50%:
E_extension50(F:L,1:8) = DE_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_extension50(F:L,1:8) = FE_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_extension50(F:L,1:8) = SE_EmgData50(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Extension 80%:
E_extension80(F:L,1:8) = DE_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_extension80(F:L,1:8) = FE_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_extension80(F:L,1:8) = SE_EmgData80(801:1400,:);
F = F+K;
L = L+K;

allE_Extension(1:1800,1:8) = E_extension30;
allE_Extension(1801:3600,1:8) = E_extension50;
allE_Extension(3601:5400,1:8) = E_extension80;