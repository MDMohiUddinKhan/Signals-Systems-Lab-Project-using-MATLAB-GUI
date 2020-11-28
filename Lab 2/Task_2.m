function Task_2()
clear all
close all
clc

%% Just see what does mod() function
t = 0:0.1:2;
mod(t,1)
%%

p = inline(['mod(t,1)*4.*(mod(t,1)<1/4)+','((mod(t,1)*(-4))+2).*((mod(t,1)>=1/4)&(mod(t,1)<3/4))+','((mod(t,1)*4)-4).*((mod(t,1)>=3/4)&(mod(t,1)<1))'],'t');

t = 3:0.001:5;
plot(t,p(t),'LineWidth',2)
grid on

end