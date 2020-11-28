function Assignment_2a()

Built_in_Square_Wave_Function()
pause(3);

% Theory & code for Recontsructed square wave & Gibbs Phenomena
web('https://gsegon.wordpress.com/2013/08/15/fourier-series-part-2-square-wave-example/');
% for more, doc web

% Must see from: doc Square Wave from Sine Waves
pause(3);

% for more type in command window 'doc figure' , 'doc Figure Properties'
f = figure('Name','Assignment_2a','NumberTitle','off');
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
    
t = linspace(-2,2,10000);   % time
N = [1 2 3 4 7 8 50 51 100 101 1000 2000 20000 ];  % number of harmonics
f = 0*t;                      % creates a zero valued function

for m = 1:numel(N)
    for k=-N(m):1:N(m) 
        if(k==0)                % skip the zeroth term
            continue
        end
        C_k = ((1)/(pi*1i*k))*(1-exp(-pi*1i*k));    % computes the k-th Fourier coefficient of the exponential form
        f_k = C_k*exp(2*pi*1i*k*t);                 % k-th term of the series
        f = f + f_k;                                % adds the k-th term to f
    end

    plot(t, f,'k','LineWidth', 3);
    xlabel('Time', 'FontSize',15);
    ylabel('Function(Time)', 'FontSize',15);
    title(['Fourier synthesis of the square wave function with n = ', int2str(N(m)), ' harmonics.'],'FontSize',25);
    grid on  
    hold on
    
% Commented bcz, they are misdisplayed in GUI uiaxes figure. But you can uncomment and use them normally.
% % X-axis plot
% x = [0.13,0.904];
% y = [0.52,0.52];
% annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);
% 
% % Y-axis plot
% x = [0.519,0.519];
% y = [0.11,0.921];
% annotation('doublearrow',x,y,'LineWidth',2,'color','k','HeadStyle','hypocycloid','HeadSize',20);

    pause(3) 
    hold off
    f = 0*t;                      % re-creates a zero valued function before going for new calculation
end

end