clear all;

% This file contains the technical implementation of a quantum Prisoner's
% Dilemma game, parameterised on a bistable parameter 'k'.

% Here, the payoffs are defined. By changing the payoffs, we can produce
% expected utilities of other games such as 'Chicken', or 'Stag Hunt'.
alpha = 3;
beta  = 0;
gamma = 5;
delta = 1;

% The k parameter is set for Alice (and the k prime parameter is set for 
% Bob), which determines the payoffs, with respect to the unitary operator 
% parameters. Feel free to adjust these parameters to change the
% results.
k = 1;
k_prime = (1 - k);

% The cartesian grid (with an added dimension to encode the heatmap) is
% initiated.
Y  = 0;
Y1 = pi / 2;
[X , X1] = meshgrid(0.0 : 0.2 : pi, 0.0 : 0.2 : pi);

% The calculations implemented in element-wise fashion, which is then
% executed on all coordinates in the mesh grid to determine the expected
% utilities.
sx    =   sin(X  / 2) .^ 2;
sx1   =   sin(X1 / 2) .^ 2;
sx1sy =  sin(X1) .* sin(Y);
sy    =       sin(Y)  .^ 2;
sy1   =       sin(Y1) .^ 2;
syy1  = (sin(Y + Y1)) .^ 2;
cx    =  cos(X  / 2)  .^ 2;
cx1   =  cos(X1 / 2)  .^ 2;
cy    =       cos(Y)  .^ 2;
cy1   =       cos(Y1) .^ 2;
cyy1  =  cos(Y  + Y1) .^ 2;
sxsx1sycy1 = 2 .* sin(X) .* sx1sy .* cos(Y1);
cd1 = cx .* sx1 .* cy + sx .* cx1 .* sy1 - sxsx1sycy1;
dc1 = cx .* sx1 .* sy + sx .* cx1 .* cy1 - sxsx1sycy1;
cd2 = cx .* (1 - 4 .* sx1 .* cy) + sx .* (1 - 4 .* cx1 .* sy1) + sxsx1sycy1;
dc2 = cx .* (1 - 4 .* sx1 .* sy) + sx .* (1 - 4 .* cx1 .* cy1) + sxsx1sycy1;
dd1 = cx .* cx1 .* syy1 + sx .* sx1 + (1 ./ 2) .* sin(X) .* sin(X1) .* sin(Y + Y1);
dd2 = k .* k_prime .* (cx .* (1 - 4 .* cx1 .* syy1) + sx .* (1 - 4 .* sx1));
cc  = k .* k_prime .* (cx .* (1 - 4 .* cx1 .* cyy1) + sx) + cx .* cx1 .* cyy1;
cd = cd1 + k .* k_prime .* cd2;
dc = dc1 + k .* k_prime .* dc2;
dd = dd1 + dd2;

% The results are finally output to a Matlab pseudocolor plot.
pcolor(X , X1, (alpha * cc) + (beta * cd) + (gamma .* dc) + (delta .* dd));
xlabel('$U(\theta_{a},\phi_{a}=0)$','interpreter','latex','fontsize',18);
ylabel('$U(\theta_{b},\phi_{b}=\pi/2)$','interpreter','latex','fontsize',18);
title('Quantum Game','interpreter','latex','fontsize',18);
colorbar
