function Homework_Veloni_2_8_3()
t = -3:0.0001:3;
x = cos(2*pi*t) + sin(3*pi*t);

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.3','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,x,'k','LineWidth',3)
xlabel('Time(sec)','FontSize',20);
ylabel('x(t)','FontSize',20);
title('Plot of x(t) = cos(2\pit) + sin(3\pit)','FontSize',20);
grid on
hold on
% X-axis plot
x = [0.13,0.904];
y = [0.52,0.52];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

% Y-axis plot
x = [0.519,0.519];
y = [0.11,0.921];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

end