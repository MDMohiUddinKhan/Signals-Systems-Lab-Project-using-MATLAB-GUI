function Homework_Veloni_2_8_15(signal_fn,n,a)
% a = 0.25 %or 2
% n=20;
% signal_fn='2*sin(14*pi*n/19)  + cos(10*pi*n/19) + 1';  %   % cos(4*pi*n/11) + 2.*i*sin(6*pi*n/11)

n = -round(n):1:round(n);

%% time scaling operation
m = n;
n1 = 0;
j = 1;
for i = 1:numel(n)
    if mod((n(1,i)/a),1)==0
        n1(1,j) = n(1,i)/a;   % bcz, x(a*n) divides time axis by a. i.e: n/a
        j = j+1;
    else
        m(1,i) = 0;     % the values of n I don't need are set to 0
    end
end
m
i = find(n==0)
m1 = setdiff(m(1,1:i-1),0)   % for more, doc setdiff
m2 = setdiff(m(1,i+1:numel(n)),0)
m  = [m1 0 m2]       
n1
% ------------------------

signal = inline(signal_fn,'n');

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Homework_Veloni_2.8.15','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

stem(n,signal(n),'k','filled','LineWidth',3,'MarkerSize',10)
xlabel('Time,n (sec)','FontSize',20);
ylabel('x(n)','FontSize',20);
title(['Plot of original discrete time input function ',signal_fn ],'FontSize',20);
grid on
pause(5)

stem(n1,signal(m),'k','filled','LineWidth',3,'MarkerSize',10)
xlabel('Time,n (sec)','FontSize',20);
ylabel('x(a*n)','FontSize',20);
title(['Plot of time scaled (',num2str(a),'n) discrete time input function ',signal_fn ],'FontSize',20);

end
