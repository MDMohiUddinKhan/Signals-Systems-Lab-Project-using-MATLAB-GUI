function Assignment_2b()

sq_wave = inline(['1*(mod(t,1)<=0.5)','-1.*(mod(t,1)>0.5 & mod(t,1)<1)'],'t');

t = -2:0.001:2;

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_2b','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,sq_wave(t),'k','LineWidth',3);
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude', 'FontSize',15);
title('Square wave plot. [A = 1, f = 1Hz, D = 50%]', 'FontSize',20);
axis([-2.1 2.1 -1.2 1.2])

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