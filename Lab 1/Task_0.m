% INITIAL MATLAB COMMANDS

clear all
close all
clc

X = [11 2 13 5
    5 15 4 7       % matrix generation style - 1 
    7 13 9 1];

Y = [11 2 13 5; 5 15 4 7; 7 13 9 1]; % matrix generation style - 2

% change a matrix
A = 5*ones(5)
A(:,2) = [1 2 3 4 6];
A(3,4) = 0;
A

%plotting
x = linspace(0,2*pi,10);
y = sin(x);
figure;
plot(y)
figure;
imagesc(y); colorbar; colormap gray;