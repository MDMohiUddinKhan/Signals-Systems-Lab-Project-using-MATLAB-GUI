function Assignment_1h()

freq = 20; % frequency = 20 Hz
t = -0.1:0.0001:0.1; % time in seconds

% for more, type in command window & hit Enter: doc square
% x = square(omega*t,duty_cycle_in_%)   
% duty cycle = (T_on/(T_on+T_off))*100% = how much % is the ON time

x = 5*square(2*pi*freq*t,60); 

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_1h','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,x,'k','LineWidth',3);
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude (Volts)', 'FontSize',15);
title('Square wave plot. [A = 5V, f = 20Hz, D = 60%]', 'FontSize',20);
axis([-0.1 0.1 -5.6 5.6]);

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