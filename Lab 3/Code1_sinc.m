function [y] = Code1_sinc(x)
y = ones(size(x));  
i = find(x~=0);     % i will have the matrix positions where x is not 0
y(i) = sin(pi*x(i))./(pi*x(i)) % y = ones(size(x)) will keep y(i) = 1 where i = find(x==0)

% During running of Code0_test() code, give breakpoint in line 2 of this Code1_sinc()
% code. Run & click step to see the variable values in the workspace. double
% click on the variables of workspace & you'll get their chart in different
% window.
% Otherwise, remove all the semicolon of the code to see the variable values. 