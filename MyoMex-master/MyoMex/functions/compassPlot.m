%compass plot
% takes input x and y (which is undetermined what excately they are yet)
% but will plot as normally follows in coordinate system. Thus for our
% project, a maximum ulnar deviation should produce coordinate (1,0)

function compassPlot(xValue, yValue)

    steps = 20; %will probably be left out

    h=[]; 
    for j=1:steps 
        delete(h)
        x = rand(1,1);      %this creates random plot data for now
        y = rand(1,1);      % input data should be normalised between 
        
        compass(x,y)      %creates a compass
        
        max_lim = 1;        %sets limit for the compass using "fake" vector arrows 
        x_fake=[0 max_lim 0 -max_lim];      % which are set as the max limit of
        y_fake=[max_lim 0 -max_lim 0];      % the compass
        h_fake=compass(x_fake,y_fake);
        hold on;
        
        h=compass(x,y)      %creates the compassplot as an object
        set(h_fake,'Visible','off');        %hides the "fake" vector arrows
        hold off;
        
        drawnow;            %draws the vector in an compass w/ max limit (-1,1)
        pause(0.01);        %change. maybe.
    end
end

