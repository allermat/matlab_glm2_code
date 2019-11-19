%% Compute SVD and inspect the matrices
clearvars; clc;
x = [2;1]
A = [1,2;-2,1]
[U,S,V] = svd(A)

%% Check if the decomposition indeed does the same transformation
y = A*x
plotVectors(x,y);
title('');
ys = U*S*V'*x
plotVectors(x,ys);

%% Check individual steps
% Plot original vector and after the rotation
vx = V'*x;
plotVectors(x,vx);
title('step 1: rotation');
% Plot the rotated vector and after the scaling
svx = S*V'*x;
plotVectors(vx,svx);
title('step 2: scaling');
% Plot the scaled vector and after the second rotation
usvx = U*S*V'*x;
plotVectors(svx,usvx);
title('step 3: rotation');


%% Compute SVD and inspect the matrices
A = [1 0 1; -1 -2 0; 0 1 -1]

% How many singular values are there? 

%% Compute SVD and inspect the matrices
B = [1 2 13;
     2 4 19;
     3 6 88];

% How many singular values are there? 

%% Compute SVD and inspect the matrices
C = [1 2; 3 4; 5 6; 7 8]

% How many singular values are there? 

% Try svd decomposition of C' (the transposition of C). What can you
% observe?