function varargout = GUI_Training(varargin)
% GUI_TRAINING MATLAB code for GUI_Training.fig
%      GUI_TRAINING, by itself, creates a new GUI_TRAINING or raises the existing
%      singleton*.
%
%      H = GUI_TRAINING returns the handle to a new GUI_TRAINING or the handle to
%      the existing singleton*.
%
%      GUI_TRAINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TRAINING.M with the given input arguments.
%
%      GUI_TRAINING('Property','Value',...) creates a new GUI_TRAINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Training_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Training_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Training

% Last Modified by GUIDE v2.5 06-Nov-2017 12:06:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Training_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Training_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before GUI_Training is made visible.
function GUI_Training_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Training (see VARARGIN)

% Adds the specific path to your MyoMex folder:
addpath('C:\Users\Simon\Documents\aKandidat\STM1\7semester-code\MyoMex-master\MyoMex');
handles.myoMex = [];

% Choose default command line output for GUI_Training
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Training wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Training_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start_MVC.
function start_MVC_Callback(hObject, eventdata, handles)
% hObject    handle to start_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%plot emg data from MYO


% --- Executes on button press in Stop_MVC.
function Stop_MVC_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%save the data when press stop

% --- Executes on button press in Fraction_MVC.
function Fraction_MVC_Callback(hObject, eventdata, handles)
% hObject    handle to Fraction_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%need the slider fraction and do something with the trapezoid


% --- Executes on slider movement.
function slider_MVC_Callback(hObject, eventdata, handles)
% hObject    handle to slider_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%        this tries to make the slider only work in discrete numbers (0.1 0.2 etc)
%           but does not work yet
%          numSteps = 11;
%          set(handles.slider_MVC, 'Min', 0);
%          set(handles.slider_MVC, 'Max', numSteps);
%          set(handles.slider_MVC, 'Value', 0.01);
%          set(handles.slider_MVC, 'SliderStep', [1/(numSteps) , 1]);
%          % save the current/last slider value
%          handles.lastSliderVal = get(handles.slider_MVC,'Value');
%          % Update handles structure
%          guidata(hObject, handles);


 sliderValue = get(handles.slider_MVC,'Value');
 set(handles.text2,'String',num2str(sliderValue));
 axesObject = findobj('Tag', 'axes1');
 cla(axesObject);
 
 

%axes(findobj('Tag', 'tagForYourAxes')); %At the 2nd place in your code where you use 'handles.axes1'

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_MVC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%rotate (handle,[1 0 0],90)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in plotbutton.
function plotbutton_Callback(hObject, eventdata, handles)
% hObject    handle to plotbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[m1,mm] = initDevice();
startRecording(m1);
sliderValue = get(handles.slider_MVC,'Value');
trapezoidPlot(sliderValue, handles.axes1, m1, mm);
stopRecording(m1,mm);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
