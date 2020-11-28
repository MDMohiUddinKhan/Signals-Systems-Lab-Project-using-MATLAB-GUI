function Assignment_4c(input,fn,m)

n = -30:30;  % Time Index
N = 5;       % Period
F = 1/N;     % Fundamental frequency
omega = 2*pi*F;


% for more type in command window 'doc figure' , 'doc Figure Properties'
    f = figure('Name','Assignment-4(c)','NumberTitle','off');
    f.WindowState = 'maximized';
    f.WindowStyle = 'docked';
    % Docked window can't be maximized. In normal MATLAB, docked window is
    % nice to look but in executable app there is no docked window mode. So I
    % also need maximized command for .exe app. So, both commands are used &
    % maximized window declared first since docked window can't be maximized.
    grid on
    hold on
    
for k = 1:numel(m)
    y_time_domain = fn((omega + 2*pi*m(k))*n);
    y_freq_domain = abs(fft(y_time_domain));
    
    subplot(2,1,1)
    stem(n,y_time_domain,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    xlabel('Time (n samples)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in time domain, where x = (2\piF + 2\pi', num2str(m(k)),')n'],'FontSize',20);
    
    subplot(2,1,2)
    stem(y_freq_domain,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    xlabel('Frequency (Hz)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    
    title(['Plot of ',input{1},' in frequency domain, where x = (2\piF + 2\pi', num2str(m(k)),')n'],'FontSize',20);
    
    pause(5)
end

xlabel('Therefore, Discrete time sinusoids, whose frequencies are separated by an integer multiple of 2\pi are identical.','FontSize',20);
    
end