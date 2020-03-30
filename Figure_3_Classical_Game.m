clear all;

% This file contains the technical implementation of a classical Prisoner's
% Dilemma game, parameterised on a bistable parameter 'k'.

% Here, the payoffs are defined. By changing the payoffs, we can produce
% expected utilities of other games such as 'Chicken', or 'Stag Hunt'.
alpha = 3;
beta  = 0;
gamma = 5; 
delta = 1;

% The k parameter is set for Alice (and the k prime parameter is set for 
% Bob), which determines the payoffs, with respect to the p and q 
% parameters. Feel free to adjust these parameters to change the
% results.
k = 1;
k_prime = (1 - k);

% The cartesian grid (with an added dimension to encode the heatmap) is
% initiated.
zzz = linspace(0.0, 0.1,  1.0);
yy  = linspace(0.0, 1.0, 10.0);
zz  = linspace(0.0, 1.0, 10.0);
[X, X1, Z] = meshgrid(yy, zz, zzz);

% The calculations implemented in element-wise fashion, which is then
% executed on all coordinates in the mesh grid to determine the expected
% utilities.
pk = 1 - X - k + 2 .* X .* k;
qk = 1 - X1 - k_prime + 2 .* X1 .* k_prime;
cc = alpha .* pk .* qk;
cd = beta .* pk .* (1 - qk);
dc = gamma .* (1 - pk) .* qk;
dd = delta .* (1 - pk) .* (1 - qk);
prof = cc + cd + dc + dd;

% The results are finally output to a Matlab pseudocolor plot.
pcolor(X, X1, prof);
xlabel('p','interpreter','latex','fontsize',18);
ylabel('q','interpreter','latex','fontsize',18);
title('Classical Game','interpreter','latex','fontsize',18);
colorbar
