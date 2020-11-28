function Homework_Veloni_2_8_13(n0)

%n0 = 6.4 or -6.4;      % if no value is given input, default value set to 6 or -6
n0 = round(n0);       % bcz, discrete function is valid only at integer time (e.g: at 5, not at 5.6)

if n0>=0
    n = -1:1:n0+4;
else
    n = n0-4:1:1;
end
impulse = n==n0;

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.13','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

stem(n,impulse,'k','filled','LineWidth',3,'MarkerSize',10,'Marker','^')
xlabel('Time,n (sec)','FontSize',20);
ylabel('\delta(n-n_{0})','FontSize',20);
title(['Plot of discrete time unit impulse function \delta(n-',num2str(n0),')'],'FontSize',20);
grid on
ylim([-0.1 1.1])
end