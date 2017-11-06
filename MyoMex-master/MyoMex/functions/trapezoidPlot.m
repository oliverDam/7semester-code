% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(inputValue);

    % gets the value from the slider (value is 1 to 10)
    %sliderValue = get(handles.slider_MVC,'Value');
    sliderValue = inputValue;

    x = [0 500 1000 3000 3800];
    y = [0.01, 0.01, sliderValue, sliderValue, 0.01];
    plothandle = handles.axes1;
    if ~isempty(plothandle);
        cla();
        hold on;
        axes(plothandle);
        plot(x,y);
    end
end
