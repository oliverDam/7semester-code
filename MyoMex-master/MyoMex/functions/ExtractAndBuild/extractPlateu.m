function [output] = extractPlateu(Ext20, Ext40, Ext60, Fle20, Fle40, Fle60, Rad20, Rad40, Rad60, Uln20, Uln40, Uln60)

Extension = [Ext20(5001:10000,:),Ext40(5001:10000,:),Ext60(5001:10000,:)];
Flexion = [Fle20(5001:10000,:),Fle40(5001:10000,:),Fle60(5001:10000,:)];
Radial = [Rad20(5001:10000,:),Rad40(5001:10000,:),Rad60(5001:10000,:)];
Ulnar = [Uln20(5001:10000,:),Uln40(5001:10000,:),Uln60(5001:10000,:)];

output = [Extension,Flexion,Radial,Ulnar];

