function [output] = loadAndFormat();

load('EmgExtension20.mat');
load('EmgExtension40.mat');
load('EmgExtension60.mat');

load('EmgFlexion20.mat');
load('EmgFlexion40.mat');
load('EmgFlexion60.mat');

load('EmgRadial20.mat');
load('EmgRadial40.mat');
load('EmgRadial60.mat');

load('EmgUlnar20.mat');
load('EmgUlnar40.mat');
load('EmgUlnar60.mat');

Extension = [EmgExtension20(5001:10000,:),EmgExtension40(5001:10000,:),EmgExtension60(5001:10000,:)];
Flexion = [EmgFlexion20(5001:10000,:),EmgFlexion40(5001:10000,:),EmgFlexion60(5001:10000,:)];
Radial = [EmgRadial20(5001:10000,:),EmgRadial40(5001:10000,:),EmgRadial60(5001:10000,:)];
Ulnar = [EmgUlnar20(5001:10000,:),EmgUlnar40(5001:10000,:),EmgUlnar60(5001:10000,:)];

output = [Extension, Flexion, Radial, Ulnar]