function Code0_test()

clear all
close all
clc

tau = 1;
%omega = linspace(-4*pi, 4*pi, 40);
omega = -0.3:1/20:0.3;
y = Code1_sinc(omega)

% During running of Code0_test() code, give breakpoint in line 2 of Code1_sinc()
% code. Run & click step to see the variable values in the workspace. double
% click on the variables of workspace & you'll get their chart in different
% window.
% Otherwise, remove all the semicolon of the code to see the variable values. 