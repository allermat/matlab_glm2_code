%% Matrix as a linear transformation
clearvars; close all; clc;

% First example
x = [2;1];
A = [1,2;-2,1];
y = A*x

% Plotting vectors
figure();
line([0,x(1)],[0,x(2)],'Color','b','LineWidth',1.5);
line([0,y(1)],[0,y(2)],'Color','r');
text(0,0,'(0,0)');
text(x(1),x(2),sprintf('(%.1f,%.1f)',x(1),x(2)));
text(x(1)/2,x(2)/2,'x','Color','b','VerticalAlignment','top');
text(y(1),y(2),sprintf('(%.1f,%.1f)',y(1),y(2)));
text(y(1)/2,y(2)/2,'y','Color','r','VerticalAlignment','top');
ylim([-5,5]);
xlim([-5,5]);
grid on

%% Pure rotation
theta = 90;
A = [cosd(theta),-sind(theta);sind(theta),cosd(theta)];
y = A*x

% Plot the vectors again, maybe this could be converted to a function! 
plotVectors(x,y);

%% Pure scaling
alpha = 2;
A = [alpha,0;0,alpha];
y = A*x

% Plot the vectors
plotVectors(x,y);
