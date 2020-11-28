function Task_1()

clc
clear all
close all

n = 0:999;
f1 = 1000;
f2 = 3000;
f3 = 6000;
fs1 = 18000; % fs > 2f_max
fs2 = 7500; % fs < 2f_max

x1 = sin(2*pi*f1*1/fs1*n); % x = 2*pi*f*t = continuous ----> discrete = 2*pi*f*n*Ts = 2*pi*f*n*(1/fs)   
x2 = sin(2*pi*f2*1/fs1*n);
x3 = sin(2*pi*f3*1/fs1*n);

x = x1 + x2 + x3;

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-1(a)','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
grid on;
    
subplot(311)
stem(n,x1,'k','LineWidth', 3)
xlim([0 100]);

subplot(312)
stem(n,x2,'k','LineWidth', 3)
xlim([0 100]);

subplot(313)
stem(n,x3,'k','LineWidth', 3)
xlim([0 100]);

pause(5);

% Continuous time plot is done just for understanding the real signal. It's
% not part of real code
subplot(311)
plot(n,x1,'k','LineWidth', 3)
xlim([0 100]);

subplot(312)
plot(n,x2,'k','LineWidth', 3)
xlim([0 100]);

subplot(313)
plot(n,x3,'k','LineWidth', 3)
xlim([0 100]);

pause(5);

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-1(b)','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
    
stem(n,x,'k','LineWidth', 3)
xlim([0 100]);
grid on;
pause(5);

plot(n,x,'k','LineWidth', 3)
xlim([0 100]);

pause(5)

x_fft = fft(x);   % also creates mirror signal in -ve y axis. 
x_fft1 = abs(fft(x)); % filter is used in circuit to remove -ve y axis signal which is done by abs() in coding

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-1(c)','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';

fs1_range = linspace(0,fs1,length(n));
plot(fs1_range,x_fft,'k','LineWidth', 3)
pause(3)
plot(fs1_range,x_fft1,'k','LineWidth', 3)
grid on;

pause(5)

s1 = sin(2*pi*f1*1/fs2*n);
s2 = sin(2*pi*f2*1/fs2*n);
s3 = sin(2*pi*f3*1/fs2*n);

s = s1 + s2 + s3;


s_fft = abs(fft(s));
% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-1(d)','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
   
fs2_range = linspace(0,fs2,length(n));
plot(fs2_range,s_fft,'k','LineWidth', 3)
grid on;


%     xlabel('...', 'FontSize',15);
%     ylabel('...', 'FontSize',15);
%     title(['...','FontSize',25);

end