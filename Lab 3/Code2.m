clear all
close all
clc

X = inline('tau*sinc(omega*tau/(2*pi))','omega','tau');
omega = linspace(-4*pi,4*pi,200);

%% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Frequency Domain Representation','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';

plot(omega,X(omega,1),'k-',omega,X(omega,0.5),'b:',omega,X(omega,2),'g--','LineWidth',2);
grid on;
axis tight;   % starts the axis from where graph starts & ends the axis at graph end
xlabel('\omega');
ylabel('X(\omega)');
legend('Baseline(\tau = 1)','Compressed(\tau = 0.5)','Expanded(\tau = 2.0)');