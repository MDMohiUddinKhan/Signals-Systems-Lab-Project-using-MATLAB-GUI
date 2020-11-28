function Assignment_1i()

freq = 20; % frequency = 20 Hz
t = -0.2:0.0001:0.2; % time in seconds

% for more, type in command window & hit Enter: doc sawtooth
% x = sawtooth(omega*t)
x = 5*sawtooth(2*pi*freq*t); 

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_1i','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,x,'k','LineWidth',3);
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude (Volts)', 'FontSize',15);
title('Sawtooth wave plot. [A = 5V, f = 20Hz]', 'FontSize',20);
axis([-0.2 0.2 -5.6 5.6]);

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