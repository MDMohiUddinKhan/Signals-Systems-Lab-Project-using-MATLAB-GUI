function Homework_Veloni_2_8_1011(T,t0)

%T = 1;
%t0 = 5.4 or -5.4;

if t0>=0
    t = 0:0.0001:t0+4;
else
    t = t0-4:0.0001:0;
end
f = 1/T ; % frequency = 1/period
sq_wave = @(t) square(2*pi*f*t,50); % doc square. doc anonymous. 50 is 50% duty cycle

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.10 & 11','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,sq_wave(t-t0),'k','LineWidth',3)
xlabel('Time,t (sec)','FontSize',20);
ylabel('Square Wave(t-t_{0})','FontSize',20);
title(['Plot of continuous time Square Wave pT(t-',num2str(t0),')'],'FontSize',20);
grid on
axis([min(t) max(t) -1.1 1.1])
end