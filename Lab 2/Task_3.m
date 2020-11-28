function Task_3()
clear all
close all
p = 2;  % try p = 100
t1 = -1/4:0.001:0.249;
t2 = 1/4:0.001:3/4;

x1 = 4*t1;
x2 = 2-4*t2;

x = [x1,x2];
t = [t1 t2];

f = figure();
f.WindowState = 'maximized';
f.WindowStyle = 'docked';
% Docked window can't be maximized. In normal MATLAB, docked window is
% nice to look but in executable app there is no docked window mode. So I
% also need maximized command for .exe app. So, both commands are used &
% maximized window declared first since docked window can't be maximized.

plot(t,x,'LineWidth',2)
grid on

c = zeros(p,length(t));
for k = 1:p
    d = ((-4*1i/(k^2*pi^2))*sin(k*pi/2));
    c(k,:) = real(d*exp(1i*k*2*pi*t) + conj(d)*exp(-1i*2*pi*k*t));
end
x_n = cumsum(c);

f = figure();
f.Window-State = 'maximized';
f.WindowStyle = 'docked';

plot(t,x_n(k,:),'LineWidth',2)
grid on

end