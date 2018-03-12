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

Extension = [EmgExtension20(1001:2000,:);EmgExtension40(1001:2000,:);EmgExtension60(1001:2000,:)];
Flexion = [EmgFlexion20(1001:2000,:);EmgFlexion40(1001:2000,:);EmgFlexion60(1001:2000,:)];
Radial = [EmgRadial20(1001:2000,:);EmgRadial40(1001:2000,:);EmgRadial60(1001:2000,:)];
Ulnar = [EmgUlnar20(1001:2000,:);EmgUlnar40(1001:2000,:);EmgUlnar60(1001:2000,:)];

output = [Extension; Flexion; Radial; Ulnar];