function Built_in_Square_Wave_Function()

freq = 1; % frequency = 1 Hz
t = -2:0.001:2; % time in seconds

% for more, type in command window & hit Enter: doc square
% x = square(omega*t,duty_cycle_in_%)   
% duty cycle = (T_on/(T_on+T_off))*100% = how much % is the ON time

x = square(2*pi*freq*t,50); 

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Built_in_Square_Wave_Function','NumberTitle','off');
f.WindowState =  'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,x,'k','LineWidth',3);
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude', 'FontSize',15);
title('Square wave plot. [A = 1, f = 1Hz, D = 50%]', 'FontSize',20);
axis([-2 2 -1.1 1.1]);

hold on
grid on

% X-axis plot
x = [0.13,0.904];
y = [0.52,0.52];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

% Y-axis plot
x = [0.519,0.519];
y = [0.11,0.921];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

end