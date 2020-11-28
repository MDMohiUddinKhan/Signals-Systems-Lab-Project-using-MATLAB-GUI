function Task_2()
%% To understand what's happening in the code, uncomment & copy the following commented codes, paste in command window
% clc
% clear all
% close all
% 
% 'x calculation'
% 
% nx_min = 1 %input('Give the lower time index of x = ');
% x = [1 2 3] %input('Give the input sequence, x = ');
% nx = nx_min:length(x)
% 
% 'h calculation'
% 
% nh_min = 1 %input('Give the lower time index of h = ');
% h = [1 1 1] %input('Give the input sequence, h = ');
% nh = nh_min:length(h)
% 
% 'y calculation'
% 
% ny = nx_min+nh_min:max(nx)+max(nh)
% y = zeros(1,length(ny))
% z = zeros(1,length(ny))
% 
% for i = 1:length(x)
%     y(i) = y(i) + x(i)
% end
% 
% for i = 1:length(h)
%     z = z + h(i)*y
%     y = circshift(y,1)  % doc circshift
% end
% y = z

%% --------------------------------------------------------------------------
nx_min = input('Give the lower time index of x = ');
x = input('Give the input sequence, x = ');
nx = nx_min:length(x)

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-2: x[n]','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
grid on; 
stem(nx,x,'k','LineWidth', 3)
xlabel('Time (n samples)', 'FontSize',15);
ylabel('x[n]', 'FontSize',15);
title('Plot of x[n]','FontSize',20);


nh_min = input('Give the lower time index of h = ');
h = input('Give the input sequence, h = ');
nh = nh_min:length(h)

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-2: h[n]','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
grid on;  
stem(nh,h,'k','LineWidth', 3)
xlabel('Time (n samples)', 'FontSize',15);
ylabel('h[n]', 'FontSize',15);
title('Plot of h[n]','FontSize',20);

ny = nx_min+nh_min:max(nx)+max(nh);
y = zeros(1,length(ny));
z = zeros(1,length(ny));

for i = 1:length(x)
    y(i) = y(i) + x(i);
end

for i = 1:length(h)
    z = z + h(i)*y;
    y = circshift(y,1);  % doc circshift
end
y = z

pause(3)
% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Lab-4 Task-2: y[n] = x[n]*h[n]','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
    
stem(ny,y,'k','LineWidth', 3)
grid on;
xlabel('Time (n samples)', 'FontSize',15);
ylabel('y[n]', 'FontSize',15);
title('Plot of convoluted signal y[n] = x[n]*h[n]','FontSize',20);


%     xlabel('...', 'FontSize',15);
%     ylabel('...', 'FontSize',15);
%     title('...','FontSize',25);

end