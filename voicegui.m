function varargout = voicegui(varargin)
% VOICEGUI MATLAB code for voicegui.fig
%      VOICEGUI, by itself, creates a new VOICEGUI or raises the existing
%      singleton*.
%
%      H = VOICEGUI returns the handle to a new VOICEGUI or the handle to
%      the existing singleton*.
%
%      VOICEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOICEGUI.M with the given input arguments.
%
%      VOICEGUI('Property','Value',...) creates a new VOICEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before voicegui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to voicegui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help voicegui

% Last Modified by GUIDE v2.5 29-Dec-2020 10:25:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @voicegui_OpeningFcn, ...
                   'gui_OutputFcn',  @voicegui_OutputFcn, ...
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


% --- Executes just before voicegui is made visible.
function voicegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to voicegui (see VARARGIN)

% Choose default command line output for voicegui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes voicegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = voicegui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_open_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile(...
    {'*.bmp;*.jpg;*.jpeg','Image Files(*.bmp,*.jpg,*.png,*.jpeg)';...
    '*.*','All Files(*.*)'},...
    'Pick an Image');
axes(handles.src);%用axes命令设定当前操作的坐标轴是axes_src
fpath=[pathname filename];%将文件名和目录名组合成一个完整的路径
imshow(imread(fpath));%用imread读入图片，并用imshow在axes_src上显示


% --------------------------------------------------------------------
function m_file_save_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_close_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
