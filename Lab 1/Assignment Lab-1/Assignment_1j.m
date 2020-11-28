function Assignment_1j()

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_1j','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

%% Plot 1
t = -0.5:0.01:3.5; % time in seconds 
for i = 1:numel(t)
    if (t(i)<0 || t(i)>3)
        y(i) = 0;
    elseif (t(i)>=0 && t(i)<=1)
        y(i) = -t(i);
    elseif (t(i)>1 && t(i)<=2)
        y(i) = 2*t(i) - 3;
    else
        y(i) = 3 - t(i);
    end
end

subplot(2,1,1)
plot(t,y,'k','LineWidth',3);
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude', 'FontSize',15);
title('Triangular wave plot - a', 'FontSize',20);

hold on
grid on
% X-axis plot
x = [0.13,0.904];
y = [0.753,0.753];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

% Y-axis plot
x = [0.2265,0.2265];
y = [0.579,0.922];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

%% Plot 2
t = -0.5:0.01:3.5; % time in seconds 
for i = 1:numel(t)
    if (t(i)<0 || t(i)>3)
        y(i) = 0;
    elseif (t(i)>=0 && t(i)<=2)
        y(i) = t(i);
    else
        y(i) = 6 - 2*t(i);
    end
end

subplot(2,1,2)
plot(t,y,'k','LineWidth',3);
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude', 'FontSize',15);
title('Triangular wave plot - b', 'FontSize',20);

hold on
grid on
% X-axis plot
x = [0.13,0.904];
y = [0.111,0.1121];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

% Y-axis plot
x = [0.2265,0.2265];
y = [0.111,0.447];
annotation('arrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

end