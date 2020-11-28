function varargout = Homepage(varargin)
% HOMEPAGE MATLAB code for Homepage.fig
%      HOMEPAGE, by itself, creates a new HOMEPAGE or raises the existing
%      singleton*.
%
%      H = HOMEPAGE returns the handle to a new HOMEPAGE or the handle to
%      the existing singleton*.
%
%      HOMEPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEPAGE.M with the given input arguments.
%
%      HOMEPAGE('Property','Value',...) creates a new HOMEPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Homepage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Homepage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Homepage

% Last Modified by GUIDE v2.5 03-Oct-2019 00:40:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Homepage_OpeningFcn, ...
                   'gui_OutputFcn',  @Homepage_OutputFcn, ...
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


% --- Executes just before Homepage is made visible.
function Homepage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Homepage (see VARARGIN)

% Choose default command line output for Homepage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Homepage wait for user response (see UIRESUME)
% uiwait(handles.Home_Page);


% --- Outputs from this function are returned to the command line.
function varargout = Homepage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% Changed here------------------------------------
% Setting background wallpaper on UIAXES
imshow('Homepage Background Resized(1920x1080 pixel).png');

% Setting background wallpaper on Top label
top_label = imread('Homepage Background Resized for top label.png');
set(handles.home_page_label,'CData',top_label);

% Setting icon on Audio Stop Button
stop_button = imread('Audio_stop_resized(10x10).png');
set(handles.stop_sound,'CData',stop_button);

%--------------------------------------------------

%% Changed Here----------------------------------
% Setting background music
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 5_Home_page_for_GUI\Audio Files\WAV format'
a = randi(3);   % randomly slelecting an audio out of 3 files available
if a==1
    [audio_1 Sample_rate_1]=audioread('Beeping on CB radio_seg_1.wav');
elseif a==2
    [audio_1 Sample_rate_1]=audioread('Beeping on CB radio_seg_2.wav');
else
    [audio_1 Sample_rate_1]=audioread('Beeping on CB radio_seg_3.wav');
end
[audio_2 Sample_rate_2]=audioread('F15 Air Combat with radio chatter.wav');
audio_1 = [audio_1; audio_2]; % 2 audio files merged together
% audioplayer can play without play blocking (so your other processes continue).
global player   % declared as global; bcz, we'll later use it to pause & resume sound
player = audioplayer(audio_1,Sample_rate_1);  % for more: doc audioplayer
play(player);
% changing directory back again to mother folder
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 5_Home_page_for_GUI'
%--------------------------------------------------

%% Changed Here----------------------------------
% Setting background wallpaper on Index_text
index_bg = imread('Index Text Background Resized.png');
set(handles.Index_text,'CData',index_bg);

% matrix keeps each character in each byte. but {'...'} keeps total sentence in a cell. I need character by character access, so kept in matrix form.
str1 = ['Assignment Index : '];   
str2 = ['Exp-0: Group Formation With Random Rolls'];
str3 = ['Exp-1: MATLAB Overview'];
str4 = ['Exp-2: Shfting,Scaling, Signal reversal & Fourier series'];
str5 = ['Exp-3: Fourier Transform'];
str6 = ['Exp-4: Sampling, Aliasing & Convolution'];
str7 = ['Developed by: Md.Mohi Uddin Khan'];

    for i=1:numel(str1)
        str11(i) = str1(i);
        set(handles.Index_text,'String',str11);
        pause(0.05)
    end
    pause(0.3)
    for i=1:numel(str2)
        str22(i) = str2(i);
        set(handles.Index_text,'String',str22);
        pause(0.05)
    end
    pause(0.3)
    for i=1:numel(str3)
        str33(i) = str3(i);
        set(handles.Index_text,'String',str33);
        pause(0.05)
    end
    pause(0.3)
    for i=1:numel(str4)
        str44(i) = str4(i);
        set(handles.Index_text,'String',str44);
        pause(0.05)
    end
    pause(0.3)
    for i=1:numel(str5)
        str55(i) = str5(i);
        set(handles.Index_text,'String',str55);
        pause(0.05)
    end
    pause(0.3)
    for i=1:numel(str6)
        str66(i) = str6(i);
        set(handles.Index_text,'String',str66);
        pause(0.05)
    end
    pause(0.3)
    for i=1:numel(str7)
        str77(i) = str7(i);
        set(handles.Index_text,'String',str77);
        pause(0.05)
    end
    
    % Following things done to force user not to press any button during
    % above index_text code are being processed. Otherwise, it'll show error.
    pause(0.35)
    handles.Assignment_0.Visible = 1;
    pause(0.3)
    handles.Assignment_1.Visible = 1;
    pause(0.25)
    handles.Assignment_2.Visible = 1;
    pause(0.2)
    handles.Assignment_3_4.Visible = 1;

%--------------------------------------------------



function Index_text_Callback(hObject, eventdata, handles)
% hObject    handle to Index_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Index_text as text
%        str2double(get(hObject,'String')) returns contents of Index_text as a double
% --- Executes during object creation, after setting all properties.
function Index_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Index_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Assignment_0.
function Assignment_0_Callback(hObject, eventdata, handles)
% hObject    handle to Assignment_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui

% kept delete afterwards, so that it's occured in background & user notice constant window
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 0_Roll Number Generator';
Roll_Number_Generator();
delete(handles.Home_Page) % closes current GUI

% --- Executes on button press in Assignment_1.
function Assignment_1_Callback(hObject, eventdata, handles)
% hObject    handle to Assignment_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui

% kept delete afterwards, so that it's occured in background & user notice constant window
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 1\Assignment Lab-1'
Asignment_Lab_1();
delete(handles.Home_Page) % closes current GUI

% --- Executes on button press in Assignment_2.
function Assignment_2_Callback(hObject, eventdata, handles)
% hObject    handle to Assignment_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui

% kept delete afterwards, so that it's occured in background & user notice constant window
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 2\Assignment Lab 2'
Asignment_Lab_2();
delete(handles.Home_Page) % closes current GUI

% --- Executes on button press in Assignment_3_4.
function Assignment_3_4_Callback(hObject, eventdata, handles)
% hObject    handle to Assignment_3_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui

% kept delete afterwards, so that it's occured in background & user notice constant window
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 4\Assignment Lab-4'
Assignment_Lab_4();
delete(handles.Home_Page) % closes current GUI


% --- Executes on button press in stop_sound.
function stop_sound_Callback(hObject, eventdata, handles)
% hObject    handle to stop_sound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player
stop(player)              % for more: doc audioplayer


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
delete(handles.Home_Page) % closes current GUI
