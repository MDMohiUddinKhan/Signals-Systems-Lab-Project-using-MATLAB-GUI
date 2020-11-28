function Assignment_2c()

triangular_wave = inline(['mod(t,1)*4.*(mod(t,1)<1/4)+','((mod(t,1)*(-4))+2).*((mod(t,1)>=1/4)&(mod(t,1)<3/4))+','((mod(t,1)*4)-4).*((mod(t,1)>=3/4)&(mod(t,1)<1))'],'t');
t = -6:0.0001:6;

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_2c','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
for i=1:2
    if i==1
        plot(t,triangular_wave(t),'k','LineWidth',3);  % Original plot
        title('Triangular wave plot (Original).', 'FontSize',20);
    else
        plot(t,triangular_wave(t/3),'k','LineWidth',3);  % Just time scaling done by t/3
        title('Triangular wave plot (t/3 Time Scaled).', 'FontSize',20);
    end
xlabel('Time (sec)', 'FontSize',15);
ylabel('Amplitude', 'FontSize',15);
axis([0 6.2 -1.2 1.2])

hold on
grid on
% X-axis plot
x = [0.13,0.904];
y = [0.52,0.52];
annotation('arrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

% Y-axis plot
x = [0.13,0.13];
y = [0.11,0.921];
annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

if i==1
    pause(10)
    hold off
end
end

end