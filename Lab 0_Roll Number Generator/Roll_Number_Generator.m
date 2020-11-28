function varargout = Roll_Number_Generator(varargin)
% ROLL_NUMBER_GENERATOR MATLAB code for Roll_Number_Generator.fig
%      ROLL_NUMBER_GENERATOR, by itself, creates a new ROLL_NUMBER_GENERATOR or raises the existing
%      singleton*.
%
%      H = ROLL_NUMBER_GENERATOR returns the handle to a new ROLL_NUMBER_GENERATOR or the handle to
%      the existing singleton*.
%
%      ROLL_NUMBER_GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROLL_NUMBER_GENERATOR.M with the given input arguments.
%
%      ROLL_NUMBER_GENERATOR('Property','Value',...) creates a new ROLL_NUMBER_GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Roll_Number_Generator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Roll_Number_Generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Roll_Number_Generator

% Last Modified by GUIDE v2.5 21-Sep-2019 02:04:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Roll_Number_Generator_OpeningFcn, ...
                   'gui_OutputFcn',  @Roll_Number_Generator_OutputFcn, ...
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

% --- Executes just before Roll_Number_Generator is made visible.
function Roll_Number_Generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Roll_Number_Generator (see VARARGIN)

% Choose default command line output for Roll_Number_Generator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Roll_Number_Generator wait for user response (see UIRESUME)
% uiwait(handles.Lab_0_GUI);


% --- Outputs from this function are returned to the command line.
function varargout = Roll_Number_Generator_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in Roll_From_Excel.
function Roll_From_Excel_Callback(hObject, eventdata, handles)
% hObject    handle to Roll_From_Excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Roll_From_Excel
if get(handles.Roll_From_Excel,'Value')  % Means: If Value is 1
    msgbox('Excel File should have extension ".xlsx". Roll numbers must be kept in "Sheet 1, Column A" of that file.',' Caution ','warn');   % For more: doc msgbox
    pause(3)  % so that user can read the msg before next code executes
end

global path Excel_Rolls    % Global variable declared
% For more: doc uigetfile
cd 'C:\';       % for security, changed to fake directory, otherwise your codes directory will be open & others will get your source code 
[file path] = uigetfile({'*.xlsx'},'Select Excel File');
cd(path)        % changing directory to selected file's path

Excel_Rolls = xlsread(file,1);
Excel_Rolls = Excel_Rolls(:,1);

% Returning to code's directory after file reading
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 0_Roll Number Generator'

% If too many Rolls, program will terminate for protecting PC from overload
if numel(Excel_Rolls)>20000
    msgbox('Too many Rolls causing OVERLOAD on PC. Use segment by segment Instead (e.g: 1 to 10000, then 10001 to 20000, so on..)','PC Overloaded','error');
    pause(5);
    clc;
    close all;
    Roll_Number_Generator();
end

set(handles.Starting_Roll,'string',num2str(min(Excel_Rolls(:,1))));
set(handles.Ending_Roll,'string',num2str(max(Excel_Rolls(:,1))));

% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc

% Input
Starting_Roll = str2num(get(handles.Starting_Roll,'string'));
Ending_Roll = str2num(get(handles.Ending_Roll,'string'));
Members_Per_Group =  str2num(get(handles.Members_Per_Group,'string'));

if isempty(Starting_Roll)
    msgbox('Empty cell detected. Enter Values Properly !!!','Invalid Input','error')   % For more: doc msgbox
elseif isempty(Ending_Roll)
    msgbox('Empty cell detected. Enter Values Properly !!!','Invalid Input','error')   % For more: doc msgbox
elseif isempty(Members_Per_Group)
    msgbox('Empty cell detected. Enter Values Properly !!!','Invalid Input','error')   % For more: doc msgbox
end

% If following condition is true, program will terminate for protecting PC from overload
if Starting_Roll > Ending_Roll
    msgbox('Starting Roll can not be higher than Ending Roll.','Invalid Input','error');
    pause(5);
    clc;
    close all;
    Roll_Number_Generator();
end
    
% Formation of initial Roll List
global Excel_Rolls   % Global variable recalled which was created earlier
if get(handles.Roll_From_Excel,'Value') == 0    
    X = Starting_Roll:Ending_Roll;
    % If too many Rolls, program will terminate for protecting PC from overload
    if numel(X)>20000
        msgbox('Too many Rolls causing OVERLOAD on PC. Use segment by segment Instead (e.g: 1 to 10000, then 10001 to 20000, so on..)','PC Overloaded','error');
        pause(5);
        clc;
        close all;
        Roll_Number_Generator();
    end
elseif get(handles.Roll_From_Excel,'Value') == 1
    for i=1:numel(Excel_Rolls(:,1))
        X(1,i) = Excel_Rolls(i,1);   % Column Matrix of Rolls Converted to Row Matrix. Bcz, whole code is written for Row X matrix format
    end
end

%% Calculation

% Odd_Even Seperation
if get(handles.Only_Odd,'Value')  % means: if Value is 1
    for i = 1:numel(X)
        X(i) = X(i)*mod(X(i),2);  % mod(3,2) = modulus, Remainder after 3/2
    end
    X = setdiff(X,0);
elseif get(handles.Only_Even,'Value')  % means: if Value is 1
    for i = 1:numel(X)
        Q(i) = X(i)*mod(X(i),2);
    end
    X = setdiff(X,Q);
else
    handles.All_Roll.Value = 1;
end

% Random Rolls Stored in 'P' Matrix    
for i = 1:numel(X)
    P(i) = X(randi(numel(X)));    % From 'X', choose a random integer from size of 'X'
    X = setdiff(X,P(i));          % From 'X' data, erase 'P(i)' data & update 'X' matrix
end

% Putting Random Rolls from Matrix 'P' to Matrix 'a' Groupwise
for i = 1:floor(numel(P)/Members_Per_Group)   % Block of Members_Per_Group Roll numbers declared. Round(y) gives the nearest integer value of y. 
                                        % floor(y) gives the nearest lowest integer value of y. Round isn't 
                                        % used here bcz, for (Ending_Roll-Starting_Roll)>5, it takes upper integer which causes matrix array out of size.
    a(i,:) = P(Members_Per_Group*(i-1)+1:Members_Per_Group*i);         % Extracting from P & storing in 'a' Matrix. Members_Per_Group*(i-1)+1:Members_Per_Group*i : when i = 2, P(Members_Per_Group*(i-1)+1:Members_Per_Group*i) = P(11:20) & so on
    P(Members_Per_Group*(i-1)+1:Members_Per_Group*i) = 0;              % Extracted positions are set 0
end
a(i+1,1:numel(P(P>0))) = P(P>0);        % Remaining values of P are extracted. P(P>0) means values of P such that P not equals 0. 

% Group Label For Excel File
for i = 1:size(a,1)
    Group(i,1) = {['Group ',num2str(i)]};
end
% Display Chart in uitable
handles.Group_List_Text.Visible = 1;
t = handles.uitable;
t.Visible = 1;
t.Data = a;

if Ending_Roll>1000000
    t.ColumnWidth = {150};
else
    t.ColumnWidth = {100};
end

global path % global variable recalled. path is the Excel File directory
if isempty(path)  % if user selects roll from file, it'll get 'path' where new Excel file of groups will be saved. But if user gives roll inpput by himself, then he needs to select folder to save the file
    % for security, changed to fake directory, otherwise your codes directory will be open & others will get your source code 
    path = uigetdir('C:\','Select Location to Save Excel File');  % for more: doc uigetdir
end
cd(path)        % changing directory to user defined path
    
% For more, type in command window & hit enter: doc Write Data to Excel Spreadsheets
xlswrite('Random Roll For Grouping.xlsx','Go to Next Sheets',1,'A3');
% Taking information of number of sheets in Excel file
% For more, type in command window & hit enter: doc xlsfinfo
[status,sheets,xlFormat] = xlsfinfo('Random Roll For Grouping.xlsx')
% Excel file write in new sheet
xlswrite('Random Roll For Grouping.xlsx',['Date_Time: ',string(datetime)],numel(sheets)+1,'A1')  % for more, help datetime
% string()  function converts anything to string format. Matrix Notation
% given [] bcz it splits into 2 columns: Date_Time:     xx-xx-xxxx
xlswrite('Random Roll For Grouping.xlsx',Group',numel(sheets)+1,'A2'); % Group' = Transpose matrix of Group
xlswrite('Random Roll For Grouping.xlsx',a',numel(sheets)+1,'A3');

set(handles.Excel_Sheet_DateTime,'string',['Excel Sheet ',num2str(numel(sheets)+1),'Date_Time',string(datetime)]);

% Returning to code's directory after file writing
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 0_Roll Number Generator'

% --- Executes on button press in Open_Excel_File.
function Open_Excel_File_Callback(hObject, eventdata, handles)
% hObject    handle to Open_Excel_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path
% If the software is just now opened & "Open Excel" clicked, it asks user to define directory for the Exel file to open.
if isempty(path)
    cd 'C:\';       % for security, changed to fake directory, otherwise your codes directory will be open & others will get your source code 
    [file path] = uigetfile({'*.xlsx'},'Select Excel File');    % For more: doc uigetfile
end    
        
cd(path)
% For more: doc winopen
winopen('Random Roll For Grouping.xlsx');
% For more: doc msgbox
msgbox('Before Clicking on "Calculate" button again, must CLOSE this Excel File','Warning','warn');
% Returning to code's directory after file reading
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 0_Roll Number Generator'

% --- Executes on button press in Only_Odd.
function Only_Odd_Callback(hObject, eventdata, handles)
% hObject    handle to Only_Odd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Only_Odd
handles.Only_Even.Value = 0;
handles.All_Roll.Value = 0;

% --- Executes on button press in Only_Even.
function Only_Even_Callback(hObject, eventdata, handles)
% hObject    handle to Only_Even (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Only_Even
handles.Only_Odd.Value = 0;
handles.All_Roll.Value = 0;

% --- Executes on button press in All_Roll.
function All_Roll_Callback(hObject, eventdata, handles)
% hObject    handle to All_Roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of All_Roll
handles.Only_Odd.Value = 0;
handles.Only_Even.Value = 0;

% --- Executes on button press in Clear_Window.
function Clear_Window_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% for any case, if other folders were open, it'll forcibly return to code's folder
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 0_Roll Number Generator'

clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

% you can write code in either format: set(handles....) & handles.xyz.... = abc
set(handles.Starting_Roll,'string',' ');
set(handles.Ending_Roll,'string',' ');
set(handles.Members_Per_Group,'string',' ');
set(handles.Excel_Sheet_DateTime,'string',' ');
handles.Only_Odd.Value = 0;
handles.Only_Even.Value = 0;
handles.All_Roll.Value = 0;
handles.Roll_From_Excel.Value = 0;
handles.Group_List_Text.Visible = 0;
handles.uitable.Visible = 0;

% --- Executes on button press in go_home.
function go_home_Callback(hObject, eventdata, handles)
% hObject    handle to go_home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

delete(handles.Lab_0_GUI) % closes current GUI
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 5_Home_page_for_GUI'
Homepage();
