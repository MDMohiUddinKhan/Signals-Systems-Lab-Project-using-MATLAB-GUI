function Assignment_3(tau)

% rectangular signal in time domain
t =  -tau:0.01:tau;
i = find(abs(t)<tau/2);
x_t = zeros(size(t));
x_t(i) = 1;

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment 3(Time Domain)','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
plot(t,x_t,'k','LineWidth',3)
xlabel('Time (t sec)','FontSize',20);
ylabel('x(t)','FontSize',20);
title('Plot of Square Pulse in Time Domain','FontSize',20);
axis([min(t) max(t) -0.1 1.1]);
grid on

% rectangular signal in frequency domain
x_w = @(tau,omega) tau.*(sin(pi*omega*tau/(2*pi)))./(pi*omega*tau/(2*pi)); % tau*sinc(omega*tau/(2*pi));
omega = linspace(-4*pi,4*pi,1000);

pause(3)
% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment 3(Frequency Domain)','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
plot(omega,x_w(tau,omega),'k','LineWidth',3)
xlabel('Frequency (\omega radian)','FontSize',20);
ylabel('x(\omega)','FontSize',20);
title('Plot of Square Pulse in Frequency Domain','FontSize',20);
xlim([min(omega) max(omega)]);
grid on
end