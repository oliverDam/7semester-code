function [output] = loadAndFormat();

load('EmgExtension40.mat');
load('EmgExtension50.mat');
load('EmgExtension70.mat');

load('EmgFlexion40.mat');
load('EmgFlexion50.mat');
load('EmgFlexion70.mat');

load('EmgRadial40.mat');
load('EmgRadial50.mat');
load('EmgRadial70.mat');

load('EmgUlnar40.mat');
load('EmgUlnar50.mat');
load('EmgUlnar70.mat');

Extension = [EmgExtension40(1001:4000,:);EmgExtension50(1001:4000,:);EmgExtension70(1001:4000,:)];
Flexion = [EmgFlexion40(1001:4000,:);EmgFlexion50(1001:4000,:);EmgFlexion70(1001:4000,:)];
Radial = [EmgRadial40(1001:4000,:);EmgRadial50(1001:4000,:);EmgRadial70(1001:4000,:)];
Ulnar = [EmgUlnar40(1001:4000,:);EmgUlnar50(1001:4000,:);EmgUlnar70(1001:4000,:)];

output = [Extension; Flexion; Radial; Ulnar];