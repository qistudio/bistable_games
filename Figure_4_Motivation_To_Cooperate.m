clear all;

% This file contains the technical implementation of the Delta-M variable,
% parameterised on a bistable parameter 'k', and the term 'b/c', as given
% in Figure 4.

% The calculation presented here is that used in the Equation 3.2. Feel
% free to change the configuration of x and y to retrieve different
% results.
x = 1;
y = 1;
f = @(k , s) (-s + (s) * (1 - x - k + 2 * k * x + 1 - y - k + 2 * k * y) - (1 - x - k + 2 * k * x));

% The results are finally output to a Matlab contour plot.
fcontour(f,'Fill','on');
xlim([0.5, 1.0])
ylim([1.0, 5.0])
xlabel('$k$','interpreter','latex','fontsize',18);
ylabel('$b/c$','interpreter','latex','fontsize',18);
title('$\Delta_{m}$ as a function of bistable parameter $k$ and cost-benefit ratio $b/c$','interpreter','latex','fontsize',18);
colorbar