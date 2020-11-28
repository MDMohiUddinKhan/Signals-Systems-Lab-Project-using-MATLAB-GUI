clear all
close all
clc

t = 0:0.001:1;
A = 8;

f_1 = 2;
s_1 = A*sin(2*pi*f_1*t);

f_2 = 4;
s_2 = A*sin(2*pi*f_2*t);

f = figure;
f.WindowState = 'maximized';

subplot(2,2,1)
plot(t,s_1,'g-','LineWidth',2)
title('2 Hz sine wave');
ylabel('Amplitude');
xlabel('Amplitude');
grid on;

subplot(2,2,2)
plot(t,s_2,'b-.','LineWidth',2)
title('4 Hz sine wave');
ylabel('Amplitude');
xlabel('Amplitude');
grid on;

subplot(2,2,3:4)
plot(t,s_1,'g-.',t,s_2,'b-.',t,s_1+s_2,'r-','LineWidth',2)
title('Summed sine wave');
ylabel('Amplitude');
xlabel('Amplitude');
legend('2 Hz','4 Hz','Sum');
grid on;

pause(3);

load handel
sound(y,Fs)

% Alternate subplot code style
f = figure;
f.WindowState = 'maximized';

subplot(221)
plot(t,s_1,'g-','LineWidth',2)
title('2 Hz sine wave');
ylabel('Amplitude');
xlabel('Amplitude');
grid on;

subplot(222)
plot(t,s_2,'b-.','LineWidth',2)
title('4 Hz sine wave');
ylabel('Amplitude');
xlabel('Amplitude');
grid on;

subplot(212)
plot(t,s_1,'g-.',t,s_2,'b-.',t,s_1+s_2,'r-','LineWidth',2)
title('Summed sine wave');
ylabel('Amplitude');
xlabel('Amplitude');
legend('2 Hz','4 Hz','Sum');
grid on;