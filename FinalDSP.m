function varargout = FinalDSP(varargin)
% FINALDSP MATLAB code for FinalDSP.fig
%      FINALDSP, by itself, creates a new FINALDSP or raises the existing
%      singleton*.
%
%      H = FINALDSP returns the handle to a new FINALDSP or the handle to
%      the existing singleton*.
%
%      FINALDSP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALDSP.M with the given input arguments.
%
%      FINALDSP('Property','Value',...) creates a new FINALDSP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FinalDSP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FinalDSP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FinalDSP

% Last Modified by GUIDE v2.5 14-May-2019 02:10:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @FinalDSP_OpeningFcn, ...
    'gui_OutputFcn',  @FinalDSP_OutputFcn, ...
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


function equalizer(hObject, handles)
hold all;
global player;
global gain;
global yT;
global Fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
              %%%%% CLEEAR ALL AXIS  $$$$$$$$$$$$$$$$$
axes(handles.axes30)
cla;
axes(handles.axes31)
cla
axes(handles.axes32)
cla
axes(handles.axes33)
cla

[f,Fs] = audioread(handles.fullpathname);%%%%READ  THE SOUND MATRIX AND THE FS FROM THE LOADED FILE
handles.g1=get(handles.slider1,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g2=get(handles.slider2,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g3=get(handles.slider3,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g4=get(handles.slider4,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g5=get(handles.slider5,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g6=get(handles.slider6,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g7=get(handles.slider7,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g8=get(handles.slider8,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.g9=get(handles.slider9,'value');%%%%%  GET THE VALUE OF GAIN FROM EACH SLIDER
handles.ofs=str2double(get(handles.outputfs,'string'));%%%%%  GET THE VALUE OF GAIN OF THE OUTPUT SAMPLE RATE
temp=get(handles.Filter,'SelectedObject');%%%%%%%%%%%% GET THE SELECTED TYPE OF FILTER
y=resample(f,handles.ofs,Fs); %%%%%%%% RESAMPLING

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            %%%%%%FIR FILTER %%%%%%%%%
if get(temp,'string')=='FIR'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%from 0-170HZ%%%%%%%%
    
cut_off=170; 
order=16; 
a=fir1(order,cut_off/(Fs/2),'low');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y1=handles.g1*filter(a,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 171-310HZ%%%%%%%%

f1=171;
f2=310;
b1=fir1(order,[f1/(Fs/2) f2/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y2=handles.g2*filter(b1,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(b1,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 311-600HZ%%%%%%%%

f3=311;
f4=600;
b2=fir1(order,[f3/(Fs/2) f4/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y3=handles.g3*filter(b2,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(b2,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 601-1000HZ%%%%%%%%

f4=601;
f5=1000;
b3=fir1(order,[f4/(Fs/2) f5/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y4=handles.g4*filter(b3,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(b3,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 1001-3000HZ%%%%%%%%

f5=1001;
f6=3000;
b4=fir1(order,[f5/(Fs/2) f6/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y5=handles.g5*filter(b4,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(b4,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 3001-6000HZ%%%%%%%%

f7=3001;
f8=6000;
b5=fir1(order,[f7/(Fs/2) f8/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y6=handles.g6*filter(b5,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(b5,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 6001-12000HZ%%%%%%%%

f9=6001;
f10=12000;
b6=fir1(order,[f9/(Fs/2) f10/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y7=handles.g7*filter(b6,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN

%%%%%%%from 12001-14000HZ%%%%%%%%

f11=12001;
f12=14000;
b7=fir1(order,[f11/(Fs/2) f12/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y8=handles.g8*filter(b7,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(b7,1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 14001-16000HZ%%%%%%%%

f13=14001;
f14=16000;
b8=fir1(order,[f13/(Fs/2) f14/(Fs/2)]);%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y9=handles.g9*filter(b8,1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yT=y1+y2+y3+y4+y5+y6+y7+y8+y9;
player = audioplayer(yT,Fs);

%%%%%%%%%%%%% PLOT THE SIGNAL BEFORE THE FILTER IN TIME DOMAIN

axes(handles.axes30)
plot(y);
title('Original signal time domain');
hold off;
grid on

%%%%%%%%%%%%% PLOT THE SIGNAL BEFORE THE FILTER IN FREQUANCY DOMAIN

axes(handles.axes31)
stem(fftshift(fft(y)));
title('Original signal freqancy domain');
grid on
hold off;
%%%%%%%%%%%%% PLOT THE SIGNAL AFTER THE FILTER IN TIME DOMAIN
axes(handles.axes32)
plot(yT);
title('New signal time domain');
grid on
hold off;

%%%%%%%%%%%%% PLOT THE SIGNAL AFTER THE FILTER IN FREQUENCY DOMAIN

axes(handles.axes33)
stem(fftshift(fft(yT)));
title('New signal Frequency domain');
grid on
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                      %%%%IIR FILTER %%%%%%%
elseif get(temp,'string')=='IIR'
%%%%%%from 0-170HZ%%%%%%%%

cut_off=170; 
order=16; 
[a ,b]=butter(order,cut_off/(Fs/2),'low','s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y1=handles.g1*filter(a,b,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a,b,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 171-310HZ%%%%%%%%

f1=171;
f2=310;
[a1 ,b1]=butter(order,[f1/(Fs/2) f2/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y2=handles.g2*filter(a1,b1,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a1,b1,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 311-600HZ%%%%%%%%

f3=311;
f4=600;
[a2 ,b2]=butter(order,[f3/(Fs/2) f4/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y3=handles.g3*filter(a2,b2,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a2,b2,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 601-1000HZ%%%%%%%%

f4=601;
f5=1000;
[a3 ,b3]=butter(order,[f4/(Fs/2) f5/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y4=handles.g4*filter(a3,b3,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a3,b3,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 1001-3000HZ%%%%%%%%

f5=1001;
f6=3000;
[a4, b4]=butter(order,[f5/(Fs/2) f6/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y5=handles.g5*filter(a4,b4,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a4,b4,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 3001-6000HZ%%%%%%%%

f7=3001;
f8=6000;
[a5 ,b5]=butter(order,[f7/(Fs/2) f8/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y6=handles.g6*filter(a5,b5,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a5,b5,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 6001-12000HZ%%%%%%%%
f9=6001;
f10=12000;
[a6 ,b6]=butter(order,[f9/(Fs/2) f10/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y7=handles.g7*filter(a6,b6,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN

%%%%%%%from 12001-14000HZ%%%%%%%%

f11=12001;
f12=14000;
[a7 ,b7]=butter(order,[f11/(Fs/2) f12/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y8=handles.g8*filter(a7,b7,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN
fvtool(a7,b7,'Fs',Fs);%%%%% TO  PLOT THE STEP RESPONCE, FREQUENCY RESPONCE ,POLE ,ZEROS,GAIN

%%%%%%%from 14001-16000HZ%%%%%%%%

f13=14001;
f14=16000;
[a8 ,b8]=butter(order,[f13/(Fs/2) f14/(Fs/2)],'s');%%%%%%% STRIP THE FREQUANCY FROM THE SOUND IN THIS GIVEN RANGE
y9=handles.g9*filter(a8,b8,y);%%%%%%%%%% FILTER THE SIGNAL AND MULIPLY BY THE GAIN

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yT=y1+y2+y3+y4+y5+y6+y7+y8+y9;%%%% Final signal combined
player = audioplayer(yT, Fs);
%%%%%%%%%%%%% PLOT THE SIGNAL BEFORE THE FILTER IN TIME DOMAIN
axes(handles.axes30)
plot(y);
title('Original signal time domain');
hold off;
grid on

%%%%%%%%%%%%% PLOT THE SIGNAL BEFORE THE FILTER IN FREQUENCY DOMAIN

axes(handles.axes31)
stem(fftshift(fft(y)));
title('Original signal freqancy domain');
hold off;
grid on

%%%%%%%%%%%%% PLOT THE SIGNAL AFTER THE FILTER IN TIME DOMAIN

axes(handles.axes32)
plot(yT);
hold off;
title('New signal time domain');
grid on

%%%%%%%%%%%%% PLOT THE SIGNAL BEFORE THE FILTER IN FREQUENCY DOMAIN

axes(handles.axes33)
stem(fftshift(fft(yT)));
grid on
hold off;
title('New signal Frequency domain');

end
guidata(hObject,handles)


% --- Executes just before FinalDSP is made visible.
function FinalDSP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata p[ reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FinalDSP (see VARARGIN)

% Choose default command line output for FinalDSP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FinalDSP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FinalDSP_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
msgbox('TO RERUN ANY CHANGE PRESS PLAY')
msgbox('To start the project input the sample and load the file and the gain and press PLAY!!!!')

varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global player;
equalizer(hObject, handles);%%%%%%%%  TO CALL THE EQUILIZER FUNCTION
play(player);%%%%%%%%%%%%%% TO PLAY THE SOUND ASSIGINED IN THE EQULIZER FUNCTION
guidata(hObject,handles)



% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
equalizer(hObject, handles);
pause(player);%%%%%%%%%%%%%% TO PAUSE THE SOUND ASSIGINED IN THE EQULIZER FUNCTION
guidata(hObject,handles)


% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
resume(player);%%%%%%%%%%%%%% TO RESUME THE SOUND ASSIGINED IN THE EQULIZER FUNCTION
guidata(hObject,handles)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
stop(player);%%%%%%%%%%%%%% TO STOP THE SOUND ASSIGINED IN THE EQULIZER FUNCTION
guidata(hObject,handles)



% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path] = uigetfile({'*.wav'},'File Selector');%%%%%%%% TO GET THE DIRECTIVE OF THE AUDIO FILE
handles.fullpathname = strcat(path, file);%%%%%%%%%%%%%%% TO SEND THE FILE  NAME TO THE EQUILIZER FUNTION
set(handles.text4, 'String',handles.fullpathname) %showing fullpathname
guidata(hObject,handles)



% --- Executes on button press in FIR.
function FIR_Callback(hObject, eventdata, handles)
% hObject    handle to FIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FIR

guidata(hObject,handles)

% --- Executes on button press in IIR.
function IIR_Callback(hObject, eventdata, handles)
% hObject    handle to IIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IIR
guidata(hObject,handles)


function gain_Callback(hObject, eventdata, handles)
% hObject    handle to gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gain as text
%        str2double(get(hObject,'String')) returns contents of gain as a double
global gain;
gain= str2double(get(hObject,'String'));%%%%%%%%%%% TO GET THE GAIN 


% --- Executes during object creation, after setting all properties.
function gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputfs_Callback(hObject, ~, handles)
% hObject    handle to outputfs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of outputfs as text
%        str2double(get(hObject,'String')) returns contents of outputfs as a double
global opfs;
opfs =str2double(get(hObject,'String')); %%%%%%%%%%%% TO GET THE OUTPUT SAMEPLE RATE FROM THE USER

% --- Executes during object creation, after setting all properties.
function outputfs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputfs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global yT;
global Fs;
audiowrite('Output.wav',yT,Fs);%%%%%%%%%%%%% TO SAVE THE EDITED SOUND IN THE OPENED FILE AS HAVING THE WAVE EXTENITION
msgbox('FILE SAVED ;)');

% --- Executes during object creation, after setting all properties.
function axes30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: place code in OpeningFcn to populate axes19


% --- Executes during object creation, after setting all properties.
function axes31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes28


% --- Executes during object creation, after setting all properties.
function axes32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes27


% --- Executes during object creation, after setting all properties.
function axes33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes26


% --- Executes during object creation, after setting all properties.
function Filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
