function [SMADRoutput] = featureExtractionSMADR(MADRoutput, MMAVoutput);

SMADR = MADRoutput/MMAVoutput  

SMADRoutput = SMADR;