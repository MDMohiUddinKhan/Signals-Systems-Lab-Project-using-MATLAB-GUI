function Close_figures_except_GUI()

% Detect all figures - close the figures that are not the GUI
fh=findall(0,'type','figure');
% OR [you can use either of fh]
fh=findobj(0,'type','figure');
nfh=length(fh); % Total number of open figures, including GUI and figures with visibility 'off'
% Scan through open figures - GUI figure number is [] (i.e. size is zero)
for i = 1:nfh 
    % Close all figures with a Number size is greater than zero
    if sum(size(fh(i).Number)) > 0
        figure(fh(i).Number);
        close(gcf);
    end
end

end