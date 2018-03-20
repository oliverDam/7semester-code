function plotTargetTrajectory(outputValue);

%Sets the outer boundaries:
x = [-20,20,20,-20,-20];
y = [20,20,-20,-20,20];
bounds = plot(x,y,'w');
hold on;

%Plots the trajectory:
plot(outputValue(:,1),outputValue(:,2));

%Sets the targets for the squares:
plotData = 10*[0.30 ,0, 0.30 ,0, 0.30 ,0, 0 ,0, -0.30 ,0, -0.30 ,0, -0.30 ,0, 0 , ... 
            0, 0.60 ,0, 0.75 ,0, 0.60 ,0, 0 ,0, -0.60 ,0, -0.75 ,0, -0.60 ,0, 0; ...
            0.30 ,0 , 0 ,0, -0.30 ,0, -0.30 ,0, -0.30 ,0, 0 ,0, 0.30 ,0, 0.30 , ...
            0, 0.60 ,0, 0 ,0, -0.60 ,0, -0.75 ,0, -0.60 ,0, 0 ,0, 0.60 ,0, 0.75];
radius = 1;

%Plots the square targets:
for i=1:31
    datplotData = plotData(:,i);
    targetAreaX = [datplotData(1,1)-radius; ... 
    datplotData(1,1)-radius; datplotData(1,1)+radius;...
    datplotData(1,1)+radius; datplotData(1,1)-radius];
                    
    targetAreaY = [datplotData(2,1)-radius; ...
    datplotData(2,1)+radius; datplotData(2,1)+radius;...
    datplotData(2,1)-radius; datplotData(2,1)-radius];

    h_target = plot(targetAreaX,targetAreaY,'r');
end