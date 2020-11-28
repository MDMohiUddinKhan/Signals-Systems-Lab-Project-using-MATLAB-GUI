function varargout = Asignment_Lab_2(varargin)
% ASIGNMENT_LAB_2 MATLAB code for Asignment_Lab_2.fig
%      ASIGNMENT_LAB_2, by itself, creates a new ASIGNMENT_LAB_2 or raises the existing
%      singleton*.
%
%      H = ASIGNMENT_LAB_2 returns the handle to a new ASIGNMENT_LAB_2 or the handle to
%      the existing singleton*.
%
%      ASIGNMENT_LAB_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASIGNMENT_LAB_2.M with the given input arguments.
%
%      ASIGNMENT_LAB_2('Property','Value',...) creates a new ASIGNMENT_LAB_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Asignment_Lab_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Asignment_Lab_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Asignment_Lab_2

% Last Modified by GUIDE v2.5 21-Sep-2019 16:29:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Asignment_Lab_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Asignment_Lab_2_OutputFcn, ...
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


% --- Executes just before Asignment_Lab_2 is made visible.
function Asignment_Lab_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Asignment_Lab_2 (see VARARGIN)

% Choose default command line output for Asignment_Lab_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Asignment_Lab_2 wait for user response (see UIRESUME)
% uiwait(handles.Lab_2_GUI);


% --- Outputs from this function are returned to the command line.
function varargout = Asignment_Lab_2_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in Two_a.
function Two_a_Callback(hObject, eventdata, handles)
% hObject    handle to Two_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% to view Axes propeties, type in command window 'uiaxes'
% for more: doc uiaxes
% for more: doc uiaxes properties

if get(handles.Maximized_plot,'Value')
    Assignment_2a()
else
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
    set(handles.Plot_here,'Value',1);
    
    % Copied from: Built_in_Square_Wave_Function()
    freq = 1; % frequency = 1 Hz
    t = -2:0.001:2; % time in seconds
    x = square(2*pi*freq*t,50); 
    % changed here
    plot(handles.GUI_Graph,t,x,'k','LineWidth',3);
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time (sec)', 'FontSize',15);
    ylabel('Amplitude', 'FontSize',15);
    title('Square wave plot. [A = 1, f = 1Hz, D = 50%]', 'FontSize',20);
    axis([-2 2 -1.1 1.1]);
    grid on
    
    pause(3);
    % Copied from: Assignment_2a()
    if get(handles.Maximized_plot,'Value')==0
    % Theory & code for Recontsructed square wave & Gibbs Phenomena
    web('https://gsegon.wordpress.com/2013/08/15/fourier-series-part-2-square-wave-example/');
    % for more, doc web
    pause(3);
    end
    
    t = linspace(-2,2,10000);   % time
    N = [1 2 3 4 7 8 50 51 100 101 1000 2000 20000 ];  % number of harmonics
    f = 0*t;                      % creates a zero valued function

    for m = 1:numel(N)
    for k=-N(m):1:N(m) 
        if(k==0)                % skip the zeroth term
            continue;
        end;
        C_k = ((1)/(pi*1i*k))*(1-exp(-pi*1i*k));    % computes the k-th Fourier coefficient of the exponential form
        f_k = C_k*exp(2*pi*1i*k*t);                 % k-th term of the series
        f = f + f_k;                                % adds the k-th term to f
    end
    % Changed here
    plot(handles.GUI_Graph,t, f,'k','LineWidth', 3);
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    grid on;
    xlabel('Time', 'FontSize',15);
    ylabel('Function(Time)', 'FontSize',15);
    title(['Fourier synthesis of the square wave function with n = ', int2str(N(m)), ' harmonics.'],'FontSize',25);
    
    pause(3) 
    f = 0*t;                      % re-creates a zero valued function before going for new calculation
    end
end
% --- Executes on button press in Two_b.
function Two_b_Callback(hObject, eventdata, handles)
% hObject    handle to Two_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Maximized_plot,'Value')
    Assignment_2b()
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied from: Assignment_2b()
    sq_wave = inline(['1*(mod(t,1)<=0.5)','-1.*(mod(t,1)>0.5 & mod(t,1)<1)'],'t');
    t = -2:0.001:2;
    
    % Changed here
    plot(handles.GUI_Graph,t,sq_wave(t),'k','LineWidth',3);
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time (sec)', 'FontSize',15);
    ylabel('Amplitude', 'FontSize',15);
    title('Square wave plot. [A = 1, f = 1Hz, D = 50%]', 'FontSize',20);
    axis([-2 2 -1.2 1.2])
    grid on
end


% --- Executes on button press in Two_c.
function Two_c_Callback(hObject, eventdata, handles)
% hObject    handle to Two_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Maximized_plot,'Value')
    Assignment_2c()
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Assignment_2c()
    triangular_wave = inline(['mod(t,1)*4.*(mod(t,1)<1/4)+','((mod(t,1)*(-4))+2).*((mod(t,1)>=1/4)&(mod(t,1)<3/4))+','((mod(t,1)*4)-4).*((mod(t,1)>=3/4)&(mod(t,1)<1))'],'t');
    t = -6:0.0001:6;
    for i=1:2
    if i==1
        % Changed here
        plot(handles.GUI_Graph,t,triangular_wave(t),'k','LineWidth',3);  % Original plot
        set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
        %
        title('Triangular wave plot (Original).', 'FontSize',20);
    else
        % Changed here
        plot(handles.GUI_Graph,t,triangular_wave(t/3),'k','LineWidth',3);  % Just time scaling done by t/3
        set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
        %
        title('Triangular wave plot (t/3 Time Scaled).', 'FontSize',20);
    end
    xlabel('Time (sec)', 'FontSize',15);
    ylabel('Amplitude', 'FontSize',15);
    axis([0 6 -1.2 1.2])
    grid on

    if i==1
    pause(10)
    end
    end
end

% --- Executes on button press in Three.
function Three_Callback(hObject, eventdata, handles)
% hObject    handle to Three (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_3()
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied Form: Homework_Veloni_2_8_3()
    t = -3:0.0001:3;
    x = cos(2*pi*t) + sin(3*pi*t);
    
    % Changed here
    plot(handles.GUI_Graph,t,x,'k','LineWidth',3)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time(sec)','FontSize',20);
    ylabel('x(t)','FontSize',20);
    title('Plot of x(t) = cos(2\pit) + sin(3\pit)','FontSize',20);
    grid on
end



% --- Executes on button press in Six.
function Six_Callback(hObject, eventdata, handles)
% hObject    handle to Six (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_6()
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_6()
    % inline function written on perunit time scale
    x = inline(['(4*mod(t,1)).*(mod(t,1)>0 & mod(t,1)<0.5) +','(4-4*mod(t,1)).*(mod(t,1)>=0.5 & mod(t,1)<1)'],'t');
    time = 0:0.0001:4;
    t = time/4; % time scaling done to convert to original time
    axis([-4.1 8.1 0 2])
    xlabel('Time(sec)','FontSize',20);
    ylabel('y','FontSize',20);
    grid on

    % Changed here
    plot(handles.GUI_Graph,time,x(t),'k','LineWidth',3)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    title('Plot of x(t)','FontSize',20);
    pause(5)

    hold on
    plot(handles.GUI_Graph,-time,x(t),'k--','LineWidth',3)
    title('Plot of x(-t)','FontSize',20);
    pause(5)

    plot(handles.GUI_Graph,2*time,x(t),'k:','LineWidth',3)
    title('Plot of x(t/2)','FontSize',20);
    pause(5)

    plot(handles.GUI_Graph,-2+time/4,x(t),'b-','LineWidth',3)
    title('Plot of x(2+4t)','FontSize',20);
    pause(5)

    plot(handles.GUI_Graph,2-time/4,x(t),'b:','LineWidth',3)
    title('Plot of x(-2-4t)','FontSize',20);

    legend({'x(t)','x(-t)','x(t/2)','x(2+4t)','x(-2-4t)'},'FontSize',18); % doc legend

    pause(5)
    title(' ');
    hold off
end


% --- Executes on button press in Seven.
function Seven_Callback(hObject, eventdata, handles)
% hObject    handle to Seven (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
x = inputdlg('Shift time (t0 sec) for u(t-t0)','Enter Input', [1 50]);
if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg('Shift time (t0 sec) for u(t-t0)','Enter Input', [1 50]);
end
t0 = str2num(x{1});

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_7(t0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_7(t0)
    u = inline('t>=0','t');
    if t0>=0
    t = -1:0.0001:t0+4;
    else
    t = t0-4:0.0001:1;
    end
    % Changed here
    plot(handles.GUI_Graph,t,u(t-t0),'k','LineWidth',3)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,t(sec)','FontSize',20);
    ylabel('u(t-t_{0})','FontSize',20);
    title(['Plot of continuous time unit step function u(t-',num2str(t0),')'],'FontSize',20);
    grid on
    axis([min(t) max(t) -0.1 1.1])
end


% --- Executes on button press in Eight.
function Eight_Callback(hObject, eventdata, handles)
% hObject    handle to Eight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
x = inputdlg('Shift time (t0 sec) for delta(t-t0)','Enter Input', [1 50]);
if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg('Shift time (t0 sec) for delta(t-t0)','Enter Input', [1 50]);
end
t0 = str2num(x{1});

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_8(t0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_8(t0)
    if t0>=0
    t = -1:0.0001:t0+4;
    else
    t = t0-4:0.0001:1;
    end
    impulse = t==t0;
    
    % Changed here
    plot(handles.GUI_Graph,t,impulse,'k','LineWidth',3)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,t (sec)','FontSize',20);
    ylabel('\delta(t-t_{0})','FontSize',20);
    title(['Plot of continuous time unit impulse function \delta(t-',num2str(t0),')'],'FontSize',20);
    grid on
    ylim([-0.1 1.1])
end

% --- Executes on button press in Nine.
function Nine_Callback(hObject, eventdata, handles)
% hObject    handle to Nine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
x = inputdlg('Shift time (t0 sec) for r(t-t0)','Enter Input', [1 50]);
if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg('Shift time (t0 sec) for r(t-t0)','Enter Input', [1 50]);
end
t0 = str2num(x{1});

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_9(t0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_9(t0)
    r = inline('t.*(t>=0)','t');
    if t0>=0
    t = -1:0.0001:t0+4;
    else
    t = t0-4:0.0001:1;
    end
    % Changed Here
    plot(handles.GUI_Graph,t,r(t-t0),'k','LineWidth',3)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,t (sec)','FontSize',20);
    ylabel('r(t-t_{0})','FontSize',20);
    title(['Plot of continuous time unit ramp function r(t-',num2str(t0),')'],'FontSize',20);
    grid on
    axis([min(t) max(t) -0.1 1.1])
end


% --- Executes on button press in Ten.
function Ten_Callback(hObject, eventdata, handles)
% hObject    handle to Ten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
x = inputdlg({'Time Period (T sec)','Shift time (t0 sec) for x(t-t0)'},'Enter Input', [1 50; 1 50]);
if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg({'Time Period (T sec)','Shift time (t0 sec) for x(t-t0)'},'Enter Input', [1 50; 1 50]);
elseif isempty(str2num(x{2}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg({'Time Period (T sec)','Shift time (t0 sec) for x(t-t0)'},'Enter Input', [1 50; 1 50]);
end
T = str2num(x{1});
t0 = str2num(x{2});

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_1011(T,t0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_1011(T,t0)
    if t0>=0
    t = 0:0.0001:t0+4;
    else
    t = t0-4:0.0001:0;
    end
    f = 1/T ; % frequency = 1/period
    sq_wave = @(t) square(2*pi*f*t,50); % doc square. doc anonymous. 50 is 50% duty cycle
    
    % Changed Here
    plot(handles.GUI_Graph,t,sq_wave(t-t0),'k','LineWidth',3)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,t (sec)','FontSize',20);
    ylabel('Square Wave(t-t_{0})','FontSize',20);
    title(['Plot of continuous time Square Wave pT(t-',num2str(t0),')'],'FontSize',20);
    grid on
    axis([min(t) max(t) -1.1 1.1])
end


% --- Executes on button press in Eleven.
function Eleven_Callback(hObject, eventdata, handles)
% hObject    handle to Eleven (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Ten_Callback(hObject, eventdata, handles)

% --- Executes on button press in Twelve.
function Twelve_Callback(hObject, eventdata, handles)
% hObject    handle to Twelve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
x = inputdlg('Shift time (n0 sample) for u(n-n0)','Enter Input', [1 50]);
if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg('Shift time (n0 sample) for u(n-n0)','Enter Input', [1 50]);
end
n0 = str2num(x{1});

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_12(n0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_12(n0)
    u = inline('n>=0','n');
    n0 = round(n0);         % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)
    if n0>=0
    n = -1:1:n0+4;   % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)
    else
    n = n0-4:1:1;
    end
    % Changed Here
    stem(handles.GUI_Graph,n,u(n-n0),'k','filled','LineWidth',3,'MarkerSize',10)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,n (sec)','FontSize',20);
    ylabel('u(n-n_{0})','FontSize',20);
    title(['Plot of discrete time unit step function u(n-',num2str(n0),')'],'FontSize',20);
    grid on
    axis([min(n) max(n) -0.1 1.1])
end



% --- Executes on button press in Thirteen.
function Thirteen_Callback(hObject, eventdata, handles)
% hObject    handle to Thirteen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
x = inputdlg('Shift time (n0 sample) for delta(n-n0)','Enter Input', [1 50]);
if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg('Shift time (n0 sample) for delta(n-n0)','Enter Input', [1 50]);
end
n0 = str2num(x{1});

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_13(n0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_13(n0)
    n0 = round(n0);       % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)
    if n0>=0
    n = -1:1:n0+4;
    else
    n = n0-4:1:1;
    end
    impulse = n==n0;
    
    % Changed Here
    stem(handles.GUI_Graph,n,impulse,'k','filled','LineWidth',3,'MarkerSize',10,'Marker','^')
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,n (sec)','FontSize',20);
    ylabel('\delta(n-n_{0})','FontSize',20);
    title(['Plot of discrete time unit impulse function \delta(n-',num2str(n0),')'],'FontSize',20);
    grid on
    ylim([-0.1 1.1])
end

% --- Executes on button press in Fourteen.
function Fourteen_Callback(hObject, eventdata, handles)
% hObject    handle to Fourteen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
str = {'Time Limit (n samples)','Shift time (n0 sample) for x(n-n0)','Signal Function (e.g: cos(4*pi*n/11) + 2.*i*sin(6*pi*n/11)  OR  2*sin(14*pi*n/19) + cos(10*pi*n/19) + 1  etc.)'};
x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);

if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);
elseif isempty(str2num(x{2}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);
elseif isempty(x{3})
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);
end
n = str2num(x{1});
n0 = str2num(x{2});
signal_fn = x{3};

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_14(signal_fn,n,n0)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_14(signal_fn,n,n0)
    n0 = round(n0);       % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)
    n = -round(n):1:round(n);
    if abs(n0)>max(abs(n))
    msgbox('Shifted time exceeds Time Limit given.','Invalid input','error');
    return    % breaks & terminates the function. 'break' is used inside 'Loop' & 'return' is used inside 'if-else'
    end
    signal = inline(signal_fn,'n')
    
    % Changed Here
    stem(handles.GUI_Graph,n,signal(n-n0),'k','filled','LineWidth',3,'MarkerSize',10)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,n (sec)','FontSize',20);
    ylabel('x(n-n_{0})','FontSize',20);
    title(['Plot of time shifted (n-',num2str(n0),') discrete time input function ',signal_fn ],'FontSize',20);
    grid on
end


% --- Executes on button press in Fifteen.
function Fifteen_Callback(hObject, eventdata, handles)
% hObject    handle to Fifteen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% For more: doc inputdlg
str = {'Time Limit (n samples)','Time Scaling Co-efficient (a) for x(a.n)','Signal Function (e.g: cos(4*pi*n/11) + 2.*i*sin(6*pi*n/11)  OR  2*sin(14*pi*n/19) + cos(10*pi*n/19) + 1  etc.)'};
x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);

if isempty(str2num(x{1}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);
elseif isempty(str2num(x{2}))
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);
elseif isempty(x{3})
    % For more: doc msgbox
    msgbox('Input Value cannot be kept empty.','Error','error');
    x = inputdlg(str,'Enter Input', [1 50; 1 50; 1 100]);
end
n = str2num(x{1});
a = str2num(x{2});
signal_fn = x{3};

if get(handles.Maximized_plot,'Value')
    Homework_Veloni_2_8_15(signal_fn,n,a)
    % If Plot_here is selected or no radio button selected, plot will be in GUI Axes
    % Code in 'else' is the same code copied from 'if' section's called function;
    % just coded for plotting in GUI axes
else
    set(handles.Plot_here,'Value',1);
    
    % Copied From: Homework_Veloni_2_8_15(signal_fn,n,a)
    n = -round(n):1:round(n);
    %% time scaling operation
    m = n;
    n1 = 0;
    j = 1;
    for i = 1:numel(n)
        if mod((n(1,i)/a),1)==0
            n1(1,j) = n(1,i)/a;   % bcz, x(a*n) divides time axis by a. i.e: n/a
            j = j+1;
        else
             m(1,i) = 0;     % the values of n I don't need are set to 0
        end
    end
    m
    i = find(n==0)
    m1 = setdiff(m(1,1:i-1),0)   % for more, doc setdiff
    m2 = setdiff(m(1,i+1:numel(n)),0)
    m  = [m1 0 m2]       
    n1
% ------------------------

    signal = inline(signal_fn,'n')
    
    % Changed Here
    stem(handles.GUI_Graph,n,signal(n),'k','filled','LineWidth',3,'MarkerSize',10)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,n (sec)','FontSize',20);
    ylabel('x(n)','FontSize',20);
    title(['Plot of original discrete time input function ',signal_fn ],'FontSize',20);
    grid on
    pause(5)
    
    % Changed Here
    stem(handles.GUI_Graph,n1,signal(m),'k','filled','LineWidth',3,'MarkerSize',10)
    set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
    %
    xlabel('Time,n (sec)','FontSize',20);
    ylabel('x(a*n)','FontSize',20);
    title(['Plot of time scaled (',num2str(a),'n) discrete time input function ',signal_fn ],'FontSize',20);

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
f = figure('Name','Assignment-2 Questions','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
imshow('Qtn_Assignment_2.png');   % for more: doc imshow


% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment-2 Book Questions','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
imshow('Qtn_Assignment_2_book.png');   % for more: doc imshow

% --- Executes on button press in Reset_All.
function Reset_All_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_All (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc
evalin('base','clear all');  % clears the variables under current GUI. i.e: base gui
Close_figures_except_GUI()

% Clearing UIAXES
plot(handles.GUI_Graph,0,0)
set(handles.GUI_Graph,'Color',[0.3 0.75 0.93])
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

delete(handles.Lab_2_GUI) % closes current GUI
cd 'E:\IUT Books\6th Semester EEE\LAB\EEE 4602_Signals & Systems\Lab 5_Home_page_for_GUI'
Homepage();
