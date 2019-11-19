%% Load data
% MEG data from http://www.fieldtriptoolbox.org/tutorial/meg_language/
% This is the averaged evoked field in the 'fully incongruent' condtition
% from a single subject. 
% For the sake of simplicity only a set of 30 channels and 90 time samples
% were included. 
clearvars;
load megData.mat

%% Inspect original data
[T,C] = meshgrid(time,chan);
figure();
plot(T',A);
title('Original data');
xlabel('time (s)'); 
ylabel('magnetic field (T)');

%% Plot covariance matrix
figure();
Ca = cov(A);
imagesc(Ca);
caxis([-max(abs(Ca(:))),max(abs(Ca(:)))]);
axis square
colorbar;
title('Covariance matrix');

%% Compute SVD, plot singular values 
% Subtracting each column's mean from itself
[m,n] = size(A);
mn = mean(A);
A = A-repmat(mn,m,1);

% Compute SVD
[U,S,V] = svd(A);

% Plot singular values
figure();
plot(diag(S),'ko');
title('Singular values');

%% Compute principal component projection
Ap = U'*A;

% Plot covariance matrix after projection
Cap = cov(Ap');
figure();
imagesc(Cap(1:30,1:30));
caxis([-max(abs(Cap(:))),max(abs(Cap(:)))]);
axis square;
colorbar;
title('Covariance matrix, projected');

%% Plot variances based on singular values
figure(); imagesc((S(1:30,:)).^2)
caxis([-max(abs(S(:).^2)),max(abs(S(:).^2))]);
axis square;
colorbar;
title('Squared singular values');

%% Dimensionality reduction
% Plot original data
[T,C] = meshgrid(time,chan);
figure();
subplot(3,2,1), waterfall(T,C,A'), colormap([0,0,0]);
title('Original');
xlabel('time (s)'); 
ylabel('channels');

%% Dimensionality reduction 
% Plot low-rank approximations
for j = 1:5
    AA = U(:,1:j)*S(1:j,1:j)*V(:,1:j)';
    subplot(3,2,1+j);
    waterfall(T,C,AA');
    title(sprintf('%d component(s)',j));
    xlabel('time (s)'); 
    ylabel('channels');
    % waitforbuttonpress;
end

% Compute energy
sig = diag(S);
energy1 = sig(1)/sum(sig)
energy2 = sum(sig(1:5))/sum(sig)
