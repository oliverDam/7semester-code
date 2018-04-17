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

% Last Modified by GUIDE v2.5 17-Apr-2018 14:10:24

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
%For Simon:
addpath('C:\Users\Simon\Documents\aKandidat\STM1\7semester-code\MyoMex-master\MyoMex');
%For Christian:
%addpath('C:\Users\chrko\Desktop\8semester-code\MyoMex-master\MyoMex');
handles.myoMex = [];

% Choose default command line output for GUI_Training
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Creates a t:
%t = tcpip('localhost',9090);

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
[m1,mm] = initDevice();
startRecording(m1);
movementType = get(handles.listbox1,'value');
findMVC(handles.axes1, handles.axes4, handles.regressionBarPlot, m1, 0, movementType);
stopRecording(m1,mm);


% --- Executes on button press in compassClassification.
function Stop_MVC_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%save the data when press stop
%Removes the unused axes:

hideAxesFunc(handles.axes4);
hideAxesFunc(handles.regressionBarPlot);
hideAxesFunc(handles.axes4);
hideAxesFunc(handles.axes6);
hideAxesFunc(handles.axes7);
hideAxesFunc(handles.axes8);
hideAxesFunc(handles.axes9);
hideAxesFunc(handles.axes1);

%Adds the images:
imagesInTraining(handles.axes10,handles.axes11,handles.axes12, ...
    handles.axes13, handles.axes14, handles.axes15, handles.axes16);

%Initiates the training:
[m1,mm] = initDevice();
startRecording(m1);
classificationTraining(handles.axes1, m1);
stopRecording(m1,mm);

% --- Executes on button press in Fraction_MVC.
function Fraction_MVC_Callback(hObject, eventdata, handles)
% hObject    handle to Fraction_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hideAxesFunc(handles.axes4);
hideAxesFunc(handles.axes10);
hideAxesFunc(handles.axes11);
hideAxesFunc(handles.axes12);
hideAxesFunc(handles.axes13);
hideAxesFunc(handles.axes14);
hideAxesFunc(handles.axes15);
hideAxesFunc(handles.axes16);
hideAxesFunc(handles.axes1);

[m1,mm] = initDevice();
startRecording(m1);
findMVC(handles.axes1,handles.axes4,handles.regressionBarPlot, m1, 1, 0);
stopRecording(m1,mm);


% --- Executes on button press in plotbutton.
function plotbutton_Callback(hObject, eventdata, handles)
% hObject    handle to plotbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hideAxesFunc(handles.regressionBarPlot);
hideAxesFunc(handles.axes10);
hideAxesFunc(handles.axes11);
hideAxesFunc(handles.axes12);
hideAxesFunc(handles.axes13);
hideAxesFunc(handles.axes14);
hideAxesFunc(handles.axes15);
hideAxesFunc(handles.axes16);
hideAxesFunc(handles.axes1);

[m1,mm] = initDevice();
startRecording(m1);

%Gets the needed values;
sliderValue = get(handles.listbox4,'value');
movementType = get(handles.listbox1,'value');
trapezoidPlot(sliderValue, handles.axes1, handles.axes4, m1,movementType);
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


% --- Executes on button press in TargetTest.
function TargetTest_Callback(hObject, eventdata, handles)
% hObject    handle to TargetTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hideAxesFunc(handles.axes4);
hideAxesFunc(handles.axes10);
hideAxesFunc(handles.axes11);
hideAxesFunc(handles.axes12);
hideAxesFunc(handles.axes13);
hideAxesFunc(handles.axes14);
hideAxesFunc(handles.axes15);
hideAxesFunc(handles.axes16);
hideAxesFunc(handles.regressionBarPlot);
hideAxesFunc(handles.axes1);

[m1,mm] = initDevice();
startRecording(m1);
targetSet = get(handles.listbox3,'value');
targetTest(handles.axes1,handles.axes4, ...
    handles.axes6, handles.axes7, handles.axes8, handles.axes9, m1,targetSet);
stopRecording(m1,mm);


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
