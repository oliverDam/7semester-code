
%%Extension:

F = 1;
L = 600;

%Extension 30%:
flexion30(F:L,1:8) = FDF_EmgData30;
F = F+600;
L = L+600;
flexion30(F:L,1:8) = FFF_EmgData30;
F = F+600;
L = L+600;
flexion30(F:L,1:8) = FSF_EmgData30;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 50%:
flexion50(F:L,1:8) = FDF_EmgData50;
F = F+600;
L = L+600;
flexion50(F:L,1:8) = FFF_EmgData50;
F = F+600;
L = L+600;
flexion50(F:L,1:8) = FSF_EmgData50;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 80%:
flexion80(F:L,1:8) = FDF_EmgData80;
F = F+600;
L = L+600;
flexion80(F:L,1:8) = FFF_EmgData80;
F = F+600;
L = L+600;
flexion80(F:L,1:8) = FSF_EmgData80;
F = F+600;
L = L+600;

allFlexion(1:1800,1:8) = flexion30;
allFlexion(1801:3600,1:8) = flexion50;
allFlexion(3601:5400,1:8) = flexion80;