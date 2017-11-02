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

% Last Modified by GUIDE v2.5 30-Oct-2017 11:26:34

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

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_MVC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_MVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
rotate (handle,[1 0 0],90)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end