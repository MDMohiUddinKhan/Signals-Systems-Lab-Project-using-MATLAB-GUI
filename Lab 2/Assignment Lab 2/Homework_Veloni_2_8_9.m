function Homework_Veloni_2_8_9(t0)

% u = inline('t>=0','t');
% r = t.*u;
r = inline('t.*(t>=0)','t');

%t0 = 5.6 or -5.6;      % if no value is given input, default value set to 5.6 or -5.6

if t0>=0
    t = -1:0.0001:t0+4;
else
    t = t0-4:0.0001:1;
end

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.9','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,r(t-t0),'k','LineWidth',3)
xlabel('Time,t (sec)','FontSize',20);
ylabel('r(t-t_{0})','FontSize',20);
title(['Plot of continuous time unit ramp function r(t-',num2str(t0),')'],'FontSize',20);
grid on
axis([min(t) max(t) -0.1 1.1])
end