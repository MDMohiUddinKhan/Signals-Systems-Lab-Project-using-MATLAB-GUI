function Task_1()
clear all
close all
clc

x = inline('exp(-t).*cos(2*pi*t)','t'); %exponentially damped sinusoid
t = 0:0.0001:10;

f = figure()
f.WindowState = 'maximized';
f.WindowStyle = 'docked';

subplot(3,1,1)
plot(t,x(t),'LineWidth',2);
grid on

subplot(3,1,2)
plot(t,x(2*t),'LineWidth',2);
grid on

subplot(3,1,3)
plot(t,x(t/2),'LineWidth',2);
grid on


f = figure()
f.WindowState = 'maximized';
f.WindowStyle = 'docked';

u = inline('3*(t>=0)','t'); %unit step function
t = -5:0.0001:5;

subplot(3,2,1:2)
plot(t,u(t),'LineWidth',2);
grid on

subplot(3,2,3:4)
plot(t,u(-t),'LineWidth',2);
grid on

subplot(3,2,5)
plot(t,u(t-1),'LineWidth',2);
grid on

subplot(3,2,6)
plot(t,u(t+1),'LineWidth',2);
grid on

end
