function varargout = Asignment_Lab_1(varargin)
% ASIGNMENT_LAB_1 MATLAB code for Asignment_Lab_1.fig
%      ASIGNMENT_LAB_1, by itself, creates a new ASIGNMENT_LAB_1 or raises the existing
%      singleton*.
%
%      H = ASIGNMENT_LAB_1 returns the handle to a new ASIGNMENT_LAB_1 or the handle to
%      the existing singleton*.
%
%      ASIGNMENT_LAB_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASIGNMENT_LAB_1.M with the given input arguments.
%
%      ASIGNMENT_LAB_1('Property','Value',...) creates a new ASIGNMENT_LAB_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Asignment_Lab_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Asignment_Lab_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Asignment_Lab_1

% Last Modified by GUIDE v2.5 21-Sep-2019 16:29:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Asignment_Lab_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Asignment_Lab_1_OutputFcn, ...
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

%% Initial command window clearing  ~~~~~~~~~~~~
clc
%% ~~~~~~~~~~~~~~~~~~~

% --- Executes just before Asignment_Lab_1 is made visible.
function Asignment_Lab_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Asignment_Lab_1 (see VARARGIN)

% Choose default command line output for Asignment_Lab_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Asignment_Lab_1 wait for user response (see UIRESUME)
% uiwait(handles.Lab_1_GUI);


% --- Outputs from this function are returned to the command line.
function varargout = Asignment_Lab_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% Changed here------------------------------------
% Setting Home button Icon on PushButton
home = imread('Home_icon_(resized 7x7).png');
set(handles.go_home,'CData',home);
%--------------------------------------------------

function one_a_Callback(hObject, eventdata, handles)
% hObject    handle to one_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',1,'string','Result Table :');
set(handles.one_a_dropdown_menu,'Visible',1,'string',{'Choose Answer...','Matrix 1','Matrix 2','Matrices Altogether'});
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%

% You can also create GUI table by code which can be used just in the
% function in which the table is created. Code is given below:
% f = figure(Asignment_Lab_1);
% t = uitable(f);                 % creates new uitable in the defined figure
% t.Position = [12 40 1510 400];  % Draw a table during GUI design in design window. Click on the table & see the position data at bottom-right corner Use that here & delete that table
                                  % for more, type in command window & hit Enter: doc uitable
% By advanced coding you can also accss this table globally. 

% But drawing table manually during GUI design gives you to access the uitable
% globally; Which is used in entire code below.

% --- Executes on selection change in one_a_dropdown_menu.
function one_a_dropdown_menu_Callback(hObject, eventdata, handles)
% hObject    handle to one_a_dropdown_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns one_a_dropdown_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from one_a_dropdown_menu

[matrix_1, matrix_2] = Assignment_1a();

t = handles.uitable              % 'handles.uitable' gives the access to manipulate uitable drawn in GUI design globally. It's taken as a variable t; otherwise you need to write handles.uitable.data instead of t.data & so on
t.ColumnWidth = {'auto'};        % It's defined 'auto' here because in one_b_dropdown_menu_Callback() function, I'll reset it to 100 pixels.
% It's rule to insert value in uitable as 'Cell data'; so {} curley braces are used.
get(t)                           % see the newly created uitable properties in command window

dropdown_menu = get(handles.one_a_dropdown_menu,'Value');   % for more: doc uidropdown

if isequal(dropdown_menu,2)
    t.Visible = 1                    % during GUI table design, I set Visibility 'off' in uitable property. We need to make it visible now to show data.
    t.Data = matrix_1;               % OR you can write:     handles.uitable.Data = matrix_1;  OR   set(t,'Data',matrix_1);  OR   set(handles.uitable,'Data',matrix_1);      
    t.ColumnName = {'Mat_1_C-1','Mat_1_C-2','Mat_1_C-3','Mat_1_C-4','Mat_1_C-5','Mat_1_C-6','Mat_1_C-7','Mat_1_C-8','Mat_1_C-9','Mat_1_C-10'};
    t.RowName = {'Mat_1_R-1','Mat_1_R-2','Mat_1_R-3','Mat_1_R-4','Mat_1_R-5','Mat_1_R-6','Mat_1_R-7','Mat_1_R-8','Mat_1_R-9','Mat_1_R-10'};

    get(t)                          % see how uitable properties can be changed. See the previous & new properties

elseif isequal(dropdown_menu,3)
    t.Visible = 1                    % during GUI table design, I set Visibility 'off' in uitable property. We need to make it visible now to show data.
    t.Data = matrix_2;              % Table data changed. You can also write:     handles.uitable.Data = matrix_1;  OR   set(t,'Data',matrix_1);  OR   set(handles.uitable,'Data',matrix_1);
    t.ColumnName = {'Mat_2_C-1','Mat_2_C-2','Mat_2_C-3','Mat_2_C-4','Mat_2_C-5','Mat_2_C-6','Mat_2_C-7','Mat_2_C-8','Mat_2_C-9','Mat_2_C-10'};
    t.RowName = {'Mat_2_R-1','Mat_2_R-2','Mat_2_R-3','Mat_2_R-4','Mat_2_R-5','Mat_2_R-6','Mat_2_R-7','Mat_2_R-8','Mat_2_R-9','Mat_2_R-10'};

elseif isequal(dropdown_menu,4)
    t.Visible = 1
    t.Data = matrix_1;
    p = t.Data;                     % OR you can write:    p = handles.uitable.Data;   OR       get(t,'data');    OR   get(handles.uitable,'Data');
    p(:,(end+1):(end+3)) = NaN;
    p(:,(end+1):(end+size(matrix_2,2))) = matrix_2;   % 'end' gives the position of last element. size(matrix_2,2) gives the number of column of matrix_2
    t.Data = p;
    % OR you can write:     set(t,'data',p)    OR      other formats shown above
    t.ColumnName = {};     % Column Names Cleared
    t.RowName = {};        % Row Names Cleared
    
else
    t.Visible = 0;
end

% --- Executes on button press in one_b.
function one_b_Callback(hObject, eventdata, handles)
% hObject    handle to one_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',1,'string','Result Table :');
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',1,'string',{'Choose Answer...','5x5 Random Integer Matrix-1','3rd Row of  Matrix-1 Replaced','Extracted 2x2 sub-matrix','Inverse of sub-matrix','Matrices Altogether'});
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%

% Taken to global variable. Otherwise when dropdown menu is called, eachtime it calls back Assignment_1b() which generates different random integer matrix.
global matrix_1 matrix_2 sub_matrix_2 inv_sub_matrix_2;    
% Reason for writing following line of code here instead of one_b_dropdown_menu_Callback() is given in the above comment
[matrix_1, matrix_2, sub_matrix_2, inv_sub_matrix_2] = Assignment_1b();


% --- Executes on selection change in one_b_dropdown_menu.
function one_b_dropdown_menu_Callback(hObject, eventdata, handles)
% hObject    handle to one_b_dropdown_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns one_b_dropdown_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from one_b_dropdown_menu



t = handles.uitable              % 'handles.uitable' gives the access to manipulate uitable drawn in GUI design globally. It's taken as a variable t; otherwise you need to write handles.uitable.data instead of t.data & so on
t.ColumnWidth =  {100};           % Set 100 pixels, so that all cells are clearly visible. 
% It's rule to insert value in uitable as 'Cell data'; so {} curley braces are used.
dropdown_menu = get(handles.one_b_dropdown_menu,'Value');   % for more: doc uidropdown

global matrix_1 matrix_2 sub_matrix_2 inv_sub_matrix_2; % global variables recalled which were declared earlier

if isequal(dropdown_menu,2)
    t.Visible = 1                    % during GUI table design, I set Visibility 'off' in uitable property. We need to make it visible now to show data.
    t.Data = matrix_1;               % OR you can write:     handles.uitable.Data = matrix_1;  OR   set(t,'Data',matrix_1);  OR   set(handles.uitable,'Data',matrix_1);      
    t.ColumnName = {'C-1','C-2','C-3','C-4','C-5'};
    t.RowName = {'R-1','R-2','R-3','R-4','R-5'};

elseif isequal(dropdown_menu,3)
    t.Visible = 1                    % during GUI table design, I set Visibility 'off' in uitable property. We need to make it visible now to show data.
    t.Data = matrix_2;              % Table data changed. You can also write:     handles.uitable.Data = matrix_1;  OR   set(t,'Data',matrix_1);  OR   set(handles.uitable,'Data',matrix_1);
    t.ColumnName = {'C-1','C-2','C-3','C-4','C-5'};
    t.RowName = {'R-1','R-2','R-3','R-4','R-5'};

elseif isequal(dropdown_menu,4)
    t.Visible = 1
    t.Data = sub_matrix_2;
    t.ColumnName = {'C-1','C-2'};
    t.RowName = {'R-1','R-2'};
    
elseif isequal(dropdown_menu,5)
    t.Visible = 1
    t.Data = inv_sub_matrix_2;
    t.ColumnName = {'C-1','C-2'};
    t.RowName = {'R-1','R-2'};
    
elseif isequal(dropdown_menu,6)
    t.Visible = 1
    % Matrix concatenation is only possible when matrix dimensions are similar.
    % So, following things are done.
    d = zeros(10,13);
    d(:) = NaN;
    d(1:5,1:5) = matrix_1;
    d(1:5,9:13) = matrix_2;
    d(9:10,1:2) = sub_matrix_2;
    d(9:10,9:10) = inv_sub_matrix_2;
    t.Data = d;
    t.ColumnName = {};
    t.RowName = {};    

else
    t.Visible = 0;
end

% --- Executes on button press in one_e.
function one_c_Callback(hObject, eventdata, handles)
% hObject    handle to one_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
Assignment_1c();

% --- Executes on button press in one_d.
function one_d_Callback(hObject, eventdata, handles)
% hObject    handle to one_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
Assignment_1d()

% --- Executes on button press in one_c.
function one_e_Callback(hObject, eventdata, handles)
% hObject    handle to one_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
% Titles changed
set(handles.Title_bar,'string','My Student ID is ODD Number [160021163]. Try Assignment 1(d)','FontSize',30);
set(handles.one_e,'string','N/A');
pause(4);
set(handles.Title_bar,'string','Assignment of Lab - 1','FontSize',40);
set(handles.one_e,'string','1(e)');

% --- Executes on button press in one_f.
function one_f_Callback(hObject, eventdata, handles)
% hObject    handle to one_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',1,'string','Enter +ve integer :','FontSize',20);
set(handles.input,'Visible',1,'string',' ');
set(handles.OK,'Visible',1,'string','OK','FontSize',20);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)

x = str2num(get(handles.input,'string'));
set(handles.input_static_text,'Visible',1,'string',['Factorial of ',num2str(x),': '],'FontSize',20);
set(handles.input,'Visible',1,'string',num2str(factorial(x)),'FontSize',20);

% --- Executes on button press in one_g.
function one_g_Callback(hObject, eventdata, handles)
% hObject    handle to one_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = sin(linspace(0,10*pi,100));
y = numel(x(x>0));

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',1,'string','Number of +ve values:','FontSize',20);
set(handles.input,'Visible',1,'string',y,'FontSize',20);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here
%%
% --- Executes on button press in one_j.
function one_h_Callback(hObject, eventdata, handles)
% hObject    handle to one_j (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
Assignment_1h();

% --- Executes on button press in one_i.
function one_i_Callback(hObject, eventdata, handles)
% hObject    handle to one_i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
Assignment_1i();


% --- Executes on button press in one_h.
function one_j_Callback(hObject, eventdata, handles)
% hObject    handle to one_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%
Assignment_1j();

% --- Executes on button press in View_Questions.
function View_Questions_Callback(hObject, eventdata, handles)
% hObject    handle to View_Questions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment-1 Questions','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
imshow('Qtn_Assignment_1.png');   % for more: doc imshow

% --- Executes on button press in Reset_All.
function Reset_All_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_All (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

%% Bunch of common tasks needs to be performed during each assignment pushbutton Callback
set(handles.input_static_text,'Visible',0);
set(handles.input,'Visible',0);
set(handles.OK,'Visible',0);
set(handles.result_table_text,'Visible',0);
set(handles.one_a_dropdown_menu,'Visible',0);
set(handles.one_b_dropdown_menu,'Visible',0);
set(handles.uitable,'Visible',0);  % OR you could write 'handles.uitable.Visible = 0;' type format in all codes here     
%%


% --- Executes on button press in go_home.
function go_home_Callback(hObject, eventdata, handles)
% hObject    handle to go_home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

delete(handles.Lab_1_GUI) % closes current GUI
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 5_Home_page_for_GUI'
Homepage();

function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input as text
%        str2double(get(hObject,'String')) returns contents of input as a double


% --- Executes during object creation, after setting all properties.

function input_CreateFcn(hObject,eventdata,handles) 

% --- Executes during object creation, after setting all properties.
function one_b_dropdown_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to one_b_dropdown_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
