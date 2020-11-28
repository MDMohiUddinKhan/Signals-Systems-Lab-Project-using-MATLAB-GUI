function dconv_160021163(nx,x,nh,h,msg)

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name',[msg,' x[n]'],'NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
grid on;
stem(nx,x,'filled','MarkerSize',7,'color','k','LineWidth', 3)
xlabel('Time (n samples)', 'FontSize',15);
ylabel('x[n]', 'FontSize',15);
title([msg,': Plot of x[n]'],'FontSize',20);

pause(3)
% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name',[msg,' h[n]'],'NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
grid on;  
stem(nh,h,'filled','MarkerSize',7,'color','k','LineWidth', 3)
xlabel('Time (n samples)', 'FontSize',15);
ylabel('h[n]', 'FontSize',15);
title([msg,': Plot of h[n]'],'FontSize',20);

% you can directly do convolution using built in function
% y = conv(h,x);  % For more: doc conv    & doc deconv
ny = min(nx) + min(nh) : max(nx) + max(nh);
y = zeros(1,length(ny));
z = zeros(1,length(ny));

for i = 1:length(nx)
    y(i) = y(i) + x(i);
end

for i = 1:length(nh)
    z = z + h(i)*y;
    y = circshift(y,1);  % doc circshift
end
y = z;

pause(3)
% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name',[msg,' y[n] = x[n]*h[n]'],'NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.
stem(ny,y,'filled','MarkerSize',7,'color','k','LineWidth', 3)
xlabel('Time (n samples)', 'FontSize',15);
ylabel('y[n]', 'FontSize',15);
title([msg,': Plot of convoluted signal y[n] = x[n]*h[n]'],'FontSize',20);
grid on;

end