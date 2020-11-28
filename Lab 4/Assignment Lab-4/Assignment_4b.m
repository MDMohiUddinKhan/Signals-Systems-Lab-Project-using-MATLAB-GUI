function [nx x nh h msg] = Assignment_4b()

% For More: doc inputdlg
input = inputdlg({'alpha for Ex-2.3, where 0 < alpha < 1','alpha for Ex-2.4, where alpha > 1','Time index of x:   min(n)    max(n)','Time index of h:   min(n)    max(n)'},'Input', [1 50; 1 50; 1 50; 1 50]); 

% keep showing error if input is empty
flag = 1;
while flag  % means, while flag == 1
    for i=1:size(input,1)  % row size
        if isempty(str2num(input{i}))
            msgbox('Empty input detected. Enter values properly.','Invalid Input','error'); % for more: doc msgbox
            input = inputdlg({'alpha for Ex-2.3, where 0 < alpha < 1','alpha for Ex-2.4, where alpha > 1','Time index of x:   min(n)    max(n)','Time index of h:   min(n)    max(n)'},'Input', [1 50; 1 50; 1 50; 1 50]); 
        else
            if i==size(input,1)
                flag = 0;
            end
        end
    end
end


msg = 'Openheim Ex-2.3';
nx = min(str2num(input{3})) : max(str2num(input{3}));
nh = min(str2num(input{4})) : max(str2num(input{4}));
x  = str2num(input{1}).^nx;
h  = nh;
h(:)  = 1;
dconv_160021163(nx,x,nh,h,msg);


pause(3)
msg = 'Openheim Ex-2.4';
nx = min(str2num(input{3})) : max(str2num(input{3}));
nh = min(str2num(input{4})) : max(str2num(input{4}));
h  = str2num(input{2}).^nh;
x  = nx;
x(:)  = 1;
dconv_160021163(nx,x,nh,h,msg);
end