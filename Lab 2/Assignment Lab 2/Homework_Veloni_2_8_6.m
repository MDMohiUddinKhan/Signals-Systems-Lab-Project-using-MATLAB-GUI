function Homework_Veloni_2_8_6()

% inline function written on perunit time scale
x = inline(['(4*mod(t,1)).*(mod(t,1)>0 & mod(t,1)<0.5) +','(4-4*mod(t,1)).*(mod(t,1)>=0.5 & mod(t,1)<1)'],'t');

time = 0:0.0001:4;
t = time/4; % time scaling done to convert to original time

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.6','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

axis([-4.1 8.1 0 2])
xlabel('Time(sec)','FontSize',20);
ylabel('y','FontSize',20);
hold on
grid on

plot(time,x(t),'k','LineWidth',3)
title('Plot of x(t)','FontSize',20);
pause(5)

plot(-time,x(t),'k--','LineWidth',3)
title('Plot of x(-t)','FontSize',20);
pause(5)

plot(2*time,x(t),'k:','LineWidth',3)
title('Plot of x(t/2)','FontSize',20);
pause(5)

plot(-2+time/4,x(t),'b-','LineWidth',3)
title('Plot of x(2+4t)','FontSize',20);
pause(5)

plot(2-time/4,x(t),'b:','LineWidth',3)
title('Plot of x(-2-4t)','FontSize',20);

legend({'x(t)','x(-t)','x(t/2)','x(2+4t)','x(-2-4t)'},'FontSize',18); % doc legend

pause(5)
title(' ');

end