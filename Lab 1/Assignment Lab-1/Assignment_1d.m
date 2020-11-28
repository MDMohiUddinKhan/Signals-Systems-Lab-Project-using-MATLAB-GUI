function Assignment_1d()

freq = 163:(163+8);         % frequency = 162 Hz
t = -1.5:0.00005:1.5;  % time in seconds

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_1d','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

a = zeros(1,length(t));  % initial value
for i = 1:numel(freq)    % numel() & length() gives same output
    a = a + sin(2*pi*freq(i)*t);
    subplot(9,1,i)
    plot(t,a,'k');
    grid on;
end

pause(5);
f = figure('Name','1d [last subplot]','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';

% X-axis plot
x = [0.13,0.904];
y = [0.52,0.52];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

hold on;
grid on;

% Y-axis plot
x = [0.519,0.519];
y = [0.11,0.921];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

plot(t,a,'b');
xlabel('Time (sec)', 'FontSize',15);
ylabel('Cumulative sum of sin(2\pift)', 'FontSize',15);
title('Cumulative sum of sin(2\pift) where 163\leqf\leq163+8', 'FontSize',20); % \leq = less or equal
end