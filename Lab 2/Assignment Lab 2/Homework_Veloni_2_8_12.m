function Homework_Veloni_2_8_12(n0)

u = inline('n>=0','n');

% n0 = 5.4  or -5.4;      % if no value is given input, default value set to 5 or -5
n0 = round(n0);         % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)

if n0>=0
    n = -1:1:n0+4;   % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)
else
    n = n0-4:1:1;
end

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.12','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

stem(n,u(n-n0),'k','filled','LineWidth',3,'MarkerSize',10)
xlabel('Time,n (sec)','FontSize',20);
ylabel('u(n-n_{0})','FontSize',20);
title(['Plot of discrete time unit step function u(n-',num2str(n0),')'],'FontSize',20);
grid on
axis([min(n) max(n) -0.1 1.1])
end