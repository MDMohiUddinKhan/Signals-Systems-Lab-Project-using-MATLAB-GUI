function Assignment_1c()

freq = 63; %frequency = 63 Hz
t = 0:0.00005:2; % time in seconds
omega = 2*pi*freq; % angular frequency
% Sine function using Euler's identity
sine_function = imag(exp(i*omega*t));

%% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_1c','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

subplot(2,1,1)
plot (t, sine_function,'k');
xlabel('Time (sec)', 'FontSize',15);
ylabel('sin(2\pift)', 'FontSize',15);
title('Sine function plot where 0<t<2 second & f = 63 Hz', 'FontSize',20);

subplot(2,1,2)
plot (t, sine_function,'k','LineWidth', 2);
xlabel('Time (sec)', 'FontSize',15);
ylabel('sin(2\pift)', 'FontSize',15);
title('Sine function plot where 0<t<0.2 second & f = 63 Hz', 'FontSize',20);
xlim([0 0.2]);

hold on
grid on
% X-axis plot
x = [0.13,0.904];
y = [0.279,0.279];
annotation('arrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

% Y-axis plot
x = [0.131,0.131];
y = [0.11,0.445];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

end