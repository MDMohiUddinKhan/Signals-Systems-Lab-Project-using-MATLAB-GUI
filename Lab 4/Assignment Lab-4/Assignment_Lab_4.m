function varargout = Assignment_Lab_4(varargin)
% ASSIGNMENT_LAB_4 MATLAB code for Assignment_Lab_4.fig
%      ASSIGNMENT_LAB_4, by itself, creates a new ASSIGNMENT_LAB_4 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT_LAB_4 returns the handle to a new ASSIGNMENT_LAB_4 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT_LAB_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT_LAB_4.M with the given input arguments.
%
%      ASSIGNMENT_LAB_4('Property','Value',...) creates a new ASSIGNMENT_LAB_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment_Lab_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment_Lab_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment_Lab_4

% Last Modified by GUIDE v2.5 03-Oct-2019 00:34:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment_Lab_4_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment_Lab_4_OutputFcn, ...
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


% --- Executes just before Assignment_Lab_4 is made visible.
function Assignment_Lab_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment_Lab_4 (see VARARGIN)

% Choose default command line output for Assignment_Lab_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment_Lab_4 wait for user response (see UIRESUME)
% uiwait(handles.Lab_4_GUI);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment_Lab_4_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in Three.
function Three_Callback(hObject, eventdata, handles)
% hObject    handle to Three (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% to view Axes propeties, type in command window 'uiaxes'
% for more: doc uiaxes
% for more: doc uiaxes properties

% For More: doc inputdlg
input = inputdlg({'Enter pulse width, tau: '},'Input',[1 50]);
% keep showing error if input is empty
flag = 1;
while flag  % means, while flag == 1
    for i=1:size(input,1)  % row size
        if isempty(str2num(input{i}))
            msgbox('Empty input detected. Enter values properly.','Invalid Input','error'); % for more: doc msgbox
            input = inputdlg({'Enter pulse width, tau: '},'Input',[1 50]);
        else
            if i==size(input,1)
                flag = 0;
            end
        end
    end
end

tau = str2num(input{1});

if get(handles.Maximized_plot,'Value')
    Assignment_3(tau)
else
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
    set(handles.Plot_here,'Value',1);
    
    % Copied from: Assignment_3(tau)
    % rectangular signal in time domain
    t =  -tau:0.01:tau;
    i = find(abs(t)<tau/2);
    x_t = zeros(size(t));
    x_t(i) = 1;
    
    % Changed Here
    plot(handles.Graph,t,x_t,'k','LineWidth',3)
    set(handles.Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time (t sec)','FontSize',20);
    ylabel('x(t)','FontSize',20);
    title('Plot of Square Pulse in Time Domain','FontSize',20);
    axis([min(t) max(t) -0.1 1.1]);
    grid on

    % rectangular signal in frequency domain
    x_w = @(tau,omega) tau.*(sin(pi*omega*tau/(2*pi)))./(pi*omega*tau/(2*pi)); % tau*sinc(omega*tau/(2*pi));
    omega = linspace(-4*pi,4*pi,1000);

    pause(5)
    % Changed here
    plot(handles.Graph,omega,x_w(tau,omega),'k','LineWidth',3)
    set(handles.Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Frequency (\omega radian)','FontSize',20);
    ylabel('x(\omega)','FontSize',20);
    title('Plot of Square Pulse in Frequency Domain','FontSize',20);
    xlim([min(omega) max(omega)]);
    grid on
end

% --- Executes on button press in Four_b.
function Four_b_Callback(hObject, eventdata, handles)
% hObject    handle to Four_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imshow('Openheim_Example_2_3_2_4_Qtn.PNG'); % For more: doc imshow

% to view Axes propeties, type in command window 'uiaxes'
% for more: doc uiaxes
% for more: doc uiaxes properties

if get(handles.Maximized_plot,'Value')
   [nx x nh h msg] = Assignment_4b()
else
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
    set(handles.Plot_here,'Value',1);
    
    % Copied from: [nx x nh h msg] = Assignment_4b()
    
    % For More: doc inputdlg
input = inputdlg({'alpha for Ex-2.3, where 0 < alpha < 1','alpha for Ex-2.4, where alpha > 1','Time index of x:   min(n)    max(n)','Time index of h:   min(n)    max(n)'},'Input', [1 50; 1 50; 1 50; 1 50]); 

% keep showing error if input is empty
flag = 1;
while flag  % means, while flag == 1
    for i=1:size(input,1)  % row size
        if isempty(str2num(input{i}))
            msgbox('Empty input detected. Enter values properly.','Invalid Input','error'); % for more: doc msgbox
            input = inputdlg({'alpha for Ex-2.3, where 0 < alpha < 1','alpha for Ex-2.4, where alpha > 1','Time index of x:   min(n)    max(n)','Time index of h:   min(n)    max(n)'},'Input', [1 50; 1 50; 1 50; 1 50]); 
        else
            if i==size(input,1)
                flag = 0;
            end
        end
    end
end


msg = 'Openheim Ex-2.3';
nx = min(str2num(input{3})) : max(str2num(input{3}));
nh = min(str2num(input{4})) : max(str2num(input{4}));
x  = str2num(input{1}).^nx;
h  = nh;
h(:)  = 1;

%% Copied from: dconv_160021163(nx,x,nh,h,msg)
grid on;
% changed here
stem(handles.Graph,nx,x,'filled','MarkerSize',7,'color','k','LineWidth', 3)
set(handles.Graph,'Color',[0.3 0.75 0.93])
%
xlabel('Time (n samples)', 'FontSize',15);
ylabel('x[n]', 'FontSize',15);
title([msg,': Plot of x[n]'],'FontSize',20);

pause(5)
grid on;  
% changed here
stem(handles.Graph,nh,h,'filled','MarkerSize',7,'color','k','LineWidth', 3)
set(handles.Graph,'Color',[0.3 0.75 0.93])
%
xlabel('Time (n samples)', 'FontSize',15);
ylabel('h[n]', 'FontSize',15);
title([msg,': Plot of h[n]'],'FontSize',20);

% you can directly do convolution using built in function
% y = conv(h,x);  % For more: doc conv    & doc deconv
ny = min(nx) + min(nh) : max(nx) + max(nh);
y = zeros(1,length(ny));
z = zeros(1,length(ny));

for i = 1:length(nx)
    y(i) = y(i) + x(i);
end

for i = 1:length(nh)
    z = z + h(i)*y;
    y = circshift(y,1);  % doc circshift
end
y = z;

pause(5)
% Changed here
stem(handles.Graph,ny,y,'filled','MarkerSize',7,'color','k','LineWidth', 3)
set(handles.Graph,'Color',[0.3 0.75 0.93])
%
xlabel('Time (n samples)', 'FontSize',15);
ylabel('y[n]', 'FontSize',15);
title([msg,': Plot of convoluted signal y[n] = x[n]*h[n]'],'FontSize',20);
grid on;

%%

pause(5)
msg = 'Openheim Ex-2.4';
nx = min(str2num(input{3})) : max(str2num(input{3}));
nh = min(str2num(input{4})) : max(str2num(input{4}));
h  = str2num(input{2}).^nh;
x  = nx;
x(:)  = 1;
%% Copied from: dconv_160021163(nx,x,nh,h,msg)
grid on;
% changed here
stem(handles.Graph,nx,x,'filled','MarkerSize',7,'color','k','LineWidth', 3)
set(handles.Graph,'Color',[0.3 0.75 0.93])
%
xlabel('Time (n samples)', 'FontSize',15);
ylabel('x[n]', 'FontSize',15);
title([msg,': Plot of x[n]'],'FontSize',20);

pause(5)
grid on;  
% changed here
stem(handles.Graph,nh,h,'filled','MarkerSize',7,'color','k','LineWidth', 3)
set(handles.Graph,'Color',[0.3 0.75 0.93])
%
xlabel('Time (n samples)', 'FontSize',15);
ylabel('h[n]', 'FontSize',15);
title([msg,': Plot of h[n]'],'FontSize',20);

% you can directly do convolution using built in function
% y = conv(h,x);  % For more: doc conv    & doc deconv
ny = min(nx) + min(nh) : max(nx) + max(nh);
y = zeros(1,length(ny));
z = zeros(1,length(ny));

for i = 1:length(nx)
    y(i) = y(i) + x(i);
end

for i = 1:length(nh)
    z = z + h(i)*y;
    y = circshift(y,1);  % doc circshift
end
y = z;

pause(5)
% Changed here
stem(handles.Graph,ny,y,'filled','MarkerSize',7,'color','k','LineWidth', 3)
set(handles.Graph,'Color',[0.3 0.75 0.93])
%
xlabel('Time (n samples)', 'FontSize',15);
ylabel('y[n]', 'FontSize',15);
title([msg,': Plot of convoluted signal y[n] = x[n]*h[n]'],'FontSize',20);
grid on;

%%    
end

% --- Executes on button press in Four_c.
function Four_c_Callback(hObject, eventdata, handles)
% hObject    handle to Four_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% to view Axes propeties, type in command window 'uiaxes'
% for more: doc uiaxes
% for more: doc uiaxes properties

% For More: doc inputdlg
input = inputdlg({'Enter Function: sin(x) or cos(x) or tan(x) etc','Enter some integers: m1 m2 m3 ...'},'Input', [1 50;1 50]);

% keep showing error if input is empty
flag = 1;
while flag  % means, while flag == 1
    for i=1:size(input,1)  % row size
        if isempty(str2num(input{2}))
            msgbox('Empty input detected. Enter values properly.','Invalid Input','error'); % for more: doc msgbox
            input = inputdlg({'Enter Function: sin(x) or cos(x) or tan(x) etc','Enter some integers: m1 m2 m3 ...'},'Input', [1 50;1 50]);
        else
            if i==size(input,1)
                flag = 0;
            end
        end
    end
end

fn = inline(input{1},'x');  % trigonometric function 
m = str2num(input{2});  	% Integers


if get(handles.Maximized_plot,'Value')
    Assignment_4c(input,fn,m)
else
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
    set(handles.Plot_here,'Value',1);
    
    % Copied from: Assignment_4c(input,fn,m)
    n = -30:30;  % Time Index
    N = 5;       % Period
    F = 1/N;     % Fundamental frequency
    omega = 2*pi*F;
    
for k = 1:numel(m)
    y_time_domain = fn((omega + 2*pi*m(k))*n);
    y_freq_domain = abs(fft(y_time_domain));
    % Changed here
    stem(handles.Graph,n,y_time_domain,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    set(handles.Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time (n samples)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in time domain, where x = (2\piF + 2\pi', num2str(m(k)),')n'],'FontSize',20);
    grid on
    hold on
    pause(3)
end 

hold off

for k = 1:numel(m)
    y_time_domain = fn((omega + 2*pi*m(k))*n);
    y_freq_domain = abs(fft(y_time_domain));
    % Changed here
    stem(handles.Graph,y_freq_domain,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    set(handles.Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Frequency (Hz)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in frequency domain, where x = (2\piF + 2\pi', num2str(m(k)),')n'],'FontSize',20);
    grid on
    hold on
    pause(3)
end
xlabel('Therefore, Discrete time sinusoids, whose frequencies are separated by an integer multiple of 2\pi are identical.','FontSize',20);
  
hold off
  
end

% --- Executes on button press in Four_d.
function Four_d_Callback(hObject, eventdata, handles)
% hObject    handle to Four_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% to view Axes propeties, type in command window 'uiaxes'
% for more: doc uiaxes
% for more: doc uiaxes properties

% For More: doc inputdlg
input = inputdlg({'Enter Function: sin(x) or cos(x) or tan(x) etc','Enter a rational number: p/q format'},'Input', [1 50;1 50]);

% keep showing error if input is empty
flag = 1;
while flag  % means, while flag == 1
    for i=1:size(input,1)  % row size
        if isempty(str2num(input{2}))
            msgbox('Empty input detected. Enter values properly.','Invalid Input','error'); % for more: doc msgbox
            input = inputdlg({'Enter Function: sin(x) or cos(x) or tan(x) etc','Enter a rational number: p/q format'},'Input', [1 50;1 50]);
        else
            if i==size(input,1)
                flag = 0;
            end
        end
    end
end

fn = inline(input{1},'x');  % trigonometric function 
m = str2num(input{2});  	% rational number of p/q format


if get(handles.Maximized_plot,'Value')
    Assignment_4d(input,fn,m)
else
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
    set(handles.Plot_here,'Value',1);
    
    % Copied from: Assignment_4d(input,fn,m)
    n = -60:60;  % Time Index
    
    F = m;
    y_time_domain = fn(2*pi*F*n);
    % Changed here
    stem(handles.Graph,n,y_time_domain,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    set(handles.Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time (n samples)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in Time domain, where x = (2\piF)n  &  F = ', num2str(m),' is rational number'],'FontSize',20);
    legend('Periodic Signal');
    grid on
    
    pause(7)
    y_time_domain1 = fn(m.*n);
    % Changed here
    stem(handles.Graph,n,y_time_domain1,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    set(handles.Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time (n samples)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in Time domain, where x = mn  &  F = ', num2str(m),'/2\pi is irrational number'],'FontSize',20);
    legend('Aperiodic Signal');
    grid on

pause(7)
xlabel('Carefully notice in 2nd plot using figure "data cursor" tool in Maximized window plot: y-axis values are not equal after certain interval.','FontSize',17);
pause(7)
xlabel('Therefore, a Discrete time sinusoid is periodic if its frequency is rational number.','FontSize',20);
    
end

% --- Executes on button press in Plot_here.
function Plot_here_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_here (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Plot_here
set(handles.Maximized_plot,'Value',0);

% --- Executes on button press in Maximized_plot.
function Maximized_plot_Callback(hObject, eventdata, handles)
% hObject    handle to Maximized_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Maximized_plot
set(handles.Plot_here,'Value',0);


% --- Executes on button press in View_Questions.
function View_Questions_Callback(hObject, eventdata, handles)
% hObject    handle to View_Questions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment-3 & 4 Questions','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
imshow('Qtn_Assignment_3_4.png');   % for more: doc imshow

% --- Executes on button press in Reset_All.
function Reset_All_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_All (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

% Clearing UIAXES
plot(handles.Graph,0,0)
set(handles.Graph,'Color',[0.3 0.75 0.93])
grid on
%
set(handles.Plot_here,'Value',0);
set(handles.Maximized_plot,'Value',0);

% --- Executes on button press in go_home.
function go_home_Callback(hObject, eventdata, handles)
% hObject    handle to go_home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

delete(handles.Lab_4_GUI) % closes current GUI
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 5_Home_page_for_GUI'
Homepage();
