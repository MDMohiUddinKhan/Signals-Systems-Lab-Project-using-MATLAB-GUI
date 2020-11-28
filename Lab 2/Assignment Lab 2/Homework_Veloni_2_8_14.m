function Homework_Veloni_2_8_14(signal_fn,n,n0)

% n=20;
% n0 = 5.4 %or -5.4;      % if no value is given input, default value set to 5.4 or -5.4
% signal_fn='cos(4*pi*n/11) + 2.*i*sin(6*pi*n/11)';  % 2*sin(14*pi*n/19) + cos(10*pi*n/19) + 1

n0 = round(n0);       % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)
n = -round(n):1:round(n);

if abs(n0)>max(abs(n))
    msgbox('Shifted time exceeds Time Limit given.','Invalid input','error');
    return    % breaks & terminates the function. 'break' is used inside 'Loop' & 'return' is used inside 'if-else'
end

signal = inline(signal_fn,'n')

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.14','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

stem(n,signal(n-n0),'k','filled','LineWidth',3,'MarkerSize',10)
xlabel('Time,n (sec)','FontSize',20);
ylabel('x(n-n_{0})','FontSize',20);
title(['Plot of time shifted (n-',num2str(n0),') discrete time input function ',signal_fn ],'FontSize',20);
grid on
end