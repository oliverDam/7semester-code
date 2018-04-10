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

load('EmgFist40.mat');
load('EmgFist50.mat');
load('EmgFist70.mat');

load('EmgStretch40.mat');
load('EmgStretch50.mat');
load('EmgStretch70.mat');

Extension = [EmgExtension40(1001:2000,:);EmgExtension50(1001:2000,:);EmgExtension70(1001:2000,:)];
Flexion = [EmgFlexion40(1001:2000,:);EmgFlexion50(1001:2000,:);EmgFlexion70(1001:2000,:)];
Radial = [EmgRadial40(1001:2000,:);EmgRadial50(1001:2000,:);EmgRadial70(1001:2000,:)];
Ulnar = [EmgUlnar40(1001:2000,:);EmgUlnar50(1001:2000,:);EmgUlnar70(1001:2000,:)];
Fist = [EmgFist40(1001:2000,:);EmgFist50(1001:2000,:);EmgFist70(1001:2000,:)];
Stretch = [EmgStretch40(1001:2000,:);EmgStretch50(1001:2000,:);EmgStretch70(1001:2000,:)];

output = [Extension; Flexion; Radial; Ulnar; Fist; Stretch];