function Assignment_4d(input,fn,m)

n = -60:60;  % Time Index

% for more type in command window 'doc figure' , 'doc Figure Properties'
    f = figure('Name','Assignment-4(d)','NumberTitle','off');
    f.WindowState = 'maximized';
    f.WindowStyle = 'docked';
    % Docked window can't be maximized. In normal MATLAB, docked window is
    % nice to look but in executable app there is no docked window mode. So I
    % also need maximized command for .exe app. So, both commands are used &
    % maximized window declared first since docked window can't be maximized.
    grid on
    hold on

    F = m;
    y_time_domain = fn(2*pi*F*n);
    
    subplot(2,1,1)
    stem(n,y_time_domain,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    xlabel('Time (n samples)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in Time domain, where x = (2\piF)n  &  F = ', num2str(m),' is rational number'],'FontSize',20);
    legend('Periodic Signal');
        
    y_time_domain1 = fn(m.*n);
    subplot(2,1,2)
    stem(n,y_time_domain1,'filled','MarkerSize',7,'LineWidth', 3,'color','k')
    xlabel('Time (n samples)', 'FontSize',15);
    ylabel(input{1}, 'FontSize',15);
    title(['Plot of ',input{1},' in Time domain, where x = mn  &  F = ', num2str(m),'/2\pi is irrational number'],'FontSize',20);
    legend('Aperiodic Signal');
    
pause(7)
xlabel('Carefully notice in 2nd subplot using figure "data cursor" tool: y-axis values are not equal after certain interval.','FontSize',17);
pause(7)
xlabel('Therefore, a Discrete time sinusoid is periodic if its frequency is rational number.','FontSize',20);
    
end