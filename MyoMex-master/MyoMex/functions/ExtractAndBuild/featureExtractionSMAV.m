function [SMAVoutput] = featureExtractionSMAV(MAVoutput,MMAVoutput);


allChan = MAVoutput/MMAVoutput;


SMAVoutput = allChan;
