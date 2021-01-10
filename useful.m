function varargout = useful(varargin)
% USEFUL MATLAB code for useful.fig
%      USEFUL, by itself, creates a new USEFUL or raises the existing
%      singleton*.
%
%      H = USEFUL returns the handle to a new USEFUL or the handle to
%      the existing singleton*.
%
%      USEFUL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USEFUL.M with the given input arguments.
%
%      USEFUL('Property','Value',...) creates a new USEFUL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before useful_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to useful_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help useful

% Last Modified by GUIDE v2.5 29-Dec-2020 14:35:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @useful_OpeningFcn, ...
                   'gui_OutputFcn',  @useful_OutputFcn, ...
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


% --- Executes just before useful is made visible.
function useful_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to useful (see VARARGIN)

% Choose default command line output for useful
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes useful wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = useful_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%-------------------------------------------------------------------------
% --- Executes on button press in pushbutton_open.
function pushbutton_open_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile({'*.wav;*.mp3','*.wav;*.mp3'},'ѡ�������ļ�');
if isequal([filename pathname],[0,0])
    return;
end
str=[pathname filename];%ѡ��������ļ�·�����ļ���
global temp;
global Fs;
global flag;
[temp,Fs]=audioread(str);%temp��ʾ�������� Fs��ʾƵ��
handles.y=temp;handles.Fs=Fs;
flag = 2;


% --- Executes on button press in pushbutton_play.
function pushbutton_play_Callback(hObject, eventdata, handles)
global temp;
global Fs;
sound(temp,Fs);%������Ƶ�ļ�


% --- Executes on button press in pushbutton_gt.
% ---�˴��Ժ����ƣ���ͨ��
function pushbutton_gt_Callback(hObject, eventdata, handles)
global temp;
global Fs;
y = temp;
wp=2*pi*str2double(get(handles.wp,'String'))/Fs;
ws=2*pi*str2double(get(handles.ws,'String'))/Fs;
Rp=str2double(get(handles.rp,'String'));
Rs=str2double(get(handles.rs,'String'));
wdelta=wp-ws;
N=ceil(8*pi/wdelta);%ȡ��
wn=(wp+ws)/2;
[b,a]=fir1(N,wn/pi,'high');     
        
y1=filter(b,a,y);

plot(handles.axes1,y)
title(handles.axes1,'FIR��ͨ�˲����˲�ǰ��ʱ����');
xlabel(handles.axes1,'ʱ�䣨ms)'); 
ylabel(handles.axes1,'��ֵ');

plot(handles.axes2,y1);
title(handles.axes2,'FIR��ͨ�˲����˲����ʱ����');
xlabel(handles.axes2,'ʱ�䣨ms)'); 
ylabel(handles.axes2,'��ֵ');
        
sound(y1,Fs);%�����˲���������ź�
        
F0=fft(y1,3000);
f=Fs*(0:511)/1024;
y2=fft(y,1024);
plot(handles.axes4,f,abs(y2(1:512)));
title(handles.axes4,'FIR��ͨ�˲����˲�ǰ��Ƶ��')
xlabel(handles.axes4,'Ƶ��/Hz');
ylabel(handles.axes4,'��ֵ');
plot(handles.axes5,f,abs(F0(1:512)));
title(handles.axes5,'FIR��ͨ�˲����˲����Ƶ��')
xlabel(handles.axes5,'Ƶ��/Hz');
ylabel(handles.axes5,'��ֵ');



% --- Executes on button press in pushbutton_dt.
function pushbutton_dt_Callback(hObject, eventdata, handles)
global temp;
global Fs;
wp=2*pi*str2double(get(handles.wp,'String'))/Fs;
ws=2*pi*str2double(get(handles.ws,'String'))/Fs;
Rp=str2double(get(handles.rp,'String'));
Rs=str2double(get(handles.rs,'String'));
wdelta=ws-wp;
N=ceil(8*pi/wdelta);%ȡ��
wn=(wp+ws)/2;
[b,a]=fir1(N,wn/pi,hamming(N+1));%ѡ�񴰺���������һ����ֹƵ��
       
y1=filter(b,a,temp);


plot(handles.axes1,temp)
title(handles.axes1,'FIR��ͨ�˲����˲�ǰ��ʱ����');
xlabel(handles.axes1,'ʱ�䣨ms)'); 
ylabel(handles.axes1,'��ֵ'); 

plot(handles.axes2,y1);
title(handles.axes2,'FIR��ͨ�˲����˲����ʱ����');
xlabel(handles.axes2,'ʱ�䣨ms)'); 
ylabel(handles.axes2,'��ֵ');
sound(y1,Fs);%�����˲���������ź�

F0=fft(y1,1024);
f=Fs*(0:511)/1024;
y2=fft(temp,1024);
plot(handles.axes4,f,abs(y2(1:512)));
title(handles.axes4,'FIR��ͨ�˲����˲�ǰ��Ƶ��')
xlabel(handles.axes4,'Ƶ��/Hz');
ylabel(handles.axes4,'��ֵ');
F2=plot(handles.axes5,f,abs(F0(1:512)));
title(handles.axes5,'FIR��ͨ�˲����˲����Ƶ��');
xlabel(handles.axes5,'Ƶ��/Hz');
ylabel(handles.axes5,'��ֵ');


% --- Executes on button press in pushbutton_dat.
% ---�˴��Ժ����ƣ���ͨ��
function pushbutton_dat_Callback(hObject, eventdata, handles)
global temp;
global Fs;
y=temp;
wp1=2*pi*str2double(get(handles.wp,'String'))/Fs;wp2=2*pi*str2double(get(handles.wp2,'String'))/Fs;
ws1=2*pi*str2double(get(handles.ws,'String'))/Fs;ws2=2*pi*str2double(get(handles.ws2,'String'))/Fs;
Rp=str2double(get(handles.rp,'String'));
Rs=str2double(get(handles.rs,'String'));
wp=(wp1+ws1)/2;ws=(wp2+ws2)/2;
wdelta=wp1-ws1;
N=ceil(8*pi/wdelta);%ȡ��
wn=[wp ws];
[b,a]=fir1(N,wn/pi,'bandpass');      
y1=filter(b,a,y);

plot(handles.axes1,y);
xlabel(handles.axes1,'ʱ�䣨ms)'); 
ylabel(handles.axes1,'��ֵ'); 
title(handles.axes1,'FIR��ͨ�˲����˲�ǰ��ʱ����');

plot(handles.axes2,y1);
title(handles.axes2,'FIR��ͨ�˲����˲����ʱ����');
xlabel(handles.axes2,'ʱ�䣨ms)'); 
ylabel(handles.axes2,'��ֵ'); 
        
sound(y1,Fs);%�����˲���������ź�
        
F0=fft(y1,3000);
f=Fs*(0:511)/1024;
y2=fft(y,1024);

plot(handles.axes4,f,abs(y2(1:512)));
title(handles.axes4,'FIR��ͨ�˲����˲�ǰ��Ƶ��')
xlabel(handles.axes4,'Ƶ��/Hz');
ylabel(handles.axes4,'��ֵ');

plot(handles.axes5,f,abs(F0(1:512)));
title(handles.axes5,'FIR��ͨ�˲����˲����Ƶ��')
xlabel(handles.axes5,'Ƶ��/Hz');
ylabel(handles.axes5,'��ֵ');



function wp_Callback(hObject, eventdata, handles)
% hObject    handle to wp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wp as text
%        str2double(get(hObject,'String')) returns contents of wp as a double


% --- Executes during object creation, after setting all properties.
function wp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rs_Callback(hObject, eventdata, handles)
% hObject    handle to rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rs as text
%        str2double(get(hObject,'String')) returns contents of rs as a double


% --- Executes during object creation, after setting all properties.
function rs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ws_Callback(hObject, eventdata, handles)
% hObject    handle to ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ws as text
%        str2double(get(hObject,'String')) returns contents of ws as a double


% --- Executes during object creation, after setting all properties.
function ws_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rp_Callback(hObject, eventdata, handles)
% hObject    handle to rp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rp as text
%        str2double(get(hObject,'String')) returns contents of rp as a double


% --- Executes during object creation, after setting all properties.
function rp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_ys.(��ɫʶ��)
function pushbutton_ys_Callback(hObject, eventdata, handles)
global temp;
global Fs;
global flag;
tempa = temp(:,1);%ȡ������
[~,index]=max(tempa);%���ʱ��ͼ�е�����ֵ��Ӧʱ��
timewin=floor(0.015*Fs);%���ݲ���Ƶ�ʣ�ȡ���μӼ����ʱ��Χ
xwin=tempa(index-timewin:index+timewin);%indexΪ�е�ó��μӼ���ķ�Χ
y=xcorr(xwin);%��������غ�����ȡ��Ƶy
ylen=length(y);%��Ƶ���㳤��
halflen=(ylen+1)/2 +30;
yy=y(halflen: ylen);%���ƲμӱȽϵĻ�Ƶ��Χ
[~,maxindex] = max(yy);%�õ��μӱȽϵĻ�Ƶ���ֵʱ��λ��
fmax=Fs/(maxindex+30);
if fmax<200;%��ֵ�趨200
    set(handles.edit_srcsex,'string','����');
    set(handles.edit_change,'string','Ů��');
    flag = 0.6;
else
    set(handles.edit_srcsex,'string','Ů��');
    set(handles.edit_change,'string','����');
    flag = 1.4;
end;


% --- Executes on button press in pushbutton_ysfz.
function pushbutton_ysfz_Callback(hObject, eventdata, handles)
global temp;
global Fs;
global flag;
if flag == 2;
    h=errordlg('���ȼ����ɫ','����');
    ha=get(h,'children');
 
    hu=findall(allchild(h),'style','pushbutton');
    set(hu,'string','ȷ��');
    ht=findall(ha,'type','text');
    set(ht,'fontsize',20);
else
    x1=temp(:,1); %�����y����������,ȡ��1��
    sound(voice(x1,flag),Fs);
    N=length(voice(x1,flag)); %����
    n=0:N-1;
    w=2*n*pi/N;
    y1=fft(voice(x1,flag)); %��ԭʼ�ź���FFT�任
    plot(handles.axes4,n,voice(x1,flag)) %��ԭʼ�����źŵ�ʱ����ͼ
    title(handles.axes4,'���������ź�ʱ��ͼ');
    xlabel(handles.axes4,'ʱ��t');
    ylabel(handles.axes4,'��ֵ');

    plot(handles.axes5,w/pi,abs(y1));
    title(handles.axes5,'���������ź�Ƶ��')
    xlabel(handles.axes5,'Ƶ��');
    ylabel(handles.axes5,'����');
end;



function edit_srcsex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_srcsex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_srcsex as text
%        str2double(get(hObject,'String')) returns contents of edit_srcsex as a double


% --- Executes during object creation, after setting all properties.
function edit_srcsex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_srcsex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_change_Callback(hObject, eventdata, handles)
% hObject    handle to edit_change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_change as text
%        str2double(get(hObject,'String')) returns contents of edit_change as a double


% --- Executes during object creation, after setting all properties.
function edit_change_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_fft.
function pushbutton_fft_Callback(hObject, eventdata, handles)
global temp;
global Fs;
global n;
global temp1;
global len;
n=length(temp);%��ȡ�źų���
temp1=fft(temp,n);%���п��ٸ���Ҷ�仯
len=round((length(temp1))/2);%ѡȡһ�볤��
plot(handles.axes2,abs(temp1(1:len)));%����Ƶ��ͼ
title(handles.axes2,'FFT�任�õ���Ƶ����');
xlabel(handles.axes2,'Ƶ��');
ylabel(handles.axes2,'��ֵ');


% --- Executes on button press in pushbutton_fast.
function pushbutton_fast_Callback(hObject, eventdata, handles)
global temp;
global Fs;
M=2*Fs; %����Ƶ�ʼӱ�
sound(temp,M)



% --- Executes on button press in pushbutton_slow.
function pushbutton_slow_Callback(hObject, eventdata, handles)
global temp;
global Fs;
M=0.5*Fs; %����Ƶ�ʼӱ�
sound(temp,M)


% --- Executes on button press in pushbutton_sy.
function pushbutton_sy_Callback(hObject, eventdata, handles)
global temp;
global Fs;
plot(handles.axes1,temp);%����ʱ��ͼ���ŵ�������1��
title(handles.axes1,'ʱ����');
xlabel(handles.axes1,'ʱ��')
ylabel(handles.axes1,'��ֵ')



function wp2_Callback(hObject, eventdata, handles)
% hObject    handle to wp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wp2 as text
%        str2double(get(hObject,'String')) returns contents of wp2 as a double


% --- Executes during object creation, after setting all properties.
function wp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ws2_Callback(hObject, eventdata, handles)
% hObject    handle to ws2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ws2 as text
%        str2double(get(hObject,'String')) returns contents of ws2 as a double


% --- Executes during object creation, after setting all properties.
function ws2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ws2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end