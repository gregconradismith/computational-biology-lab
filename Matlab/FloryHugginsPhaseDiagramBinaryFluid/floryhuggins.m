% FLORY_HUGGINS
%
% This MATLAB script graphs the Flory-Huggins free energy of mixing for
% different values of the coupling parameter CHI (Figure 1). In
% Flory-Huggins theory, CHI is given by u12 - (u11 + u22)/2. Positive
% values of CHI indicate that interaction of chemical species 1 and 2 is
% not preferred. In Figure 1, the common tangent line is calculated using
% MATLAB's CONVHULL function. The Flory-Huggins phase diagram is calculated
% by sweeping over many values of CHI (Figure 2).
%
% For more information, see:
% https://en.wikipedia.org/wiki/Flory–Huggins_solution_theory
%
% Author: Greg Conradi Smith
% Email: gdsmit@wm.edu or greg.conradi.smith@gmail.com

% Preamble
clear; clc; close all;
system('rm -f *png');
set(0, 'defaultAxesFontSize', 18);
set(0, 'defaultLineLineWidth', 2);

% User-defined parameters
Na = 150;
Nb = 100;
chi_list = 1/100 * [1.7, 1.9, 2.1];

% Figure 1: Free energy of mixing for each CHI value in CHI_LIST
figure(1);
a = 1 / Na;
b = 1 / Nb;
phi = linspace(0, 1, 100);

for i = 1:length(chi_list)
    chi = chi_list(i);
    f = a * phi .* log(phi) + b * (1 - phi) .* log(1 - phi) + chi * phi .* (1 - phi);
    f(1) = 0;
    f(end) = 0;
    plot(phi, f); hold on;
    
    % Compute the common tangent line using convex hull
    k = convhull(phi, f);
    k = k(2:end-1);
    plot(phi(k), f(k), '--');
    
    % Determine common tangent points
    [~, index1] = max(diff(k));
    index2 = k(index1 + 1);
    phi0 = phi([index1, index2]);
    f0 = f([index1, index2]);
    plot(phi0, f0, 'o');
end

% Graph formatting for Figure 1
grid on;
axis padded;
xlabel('\phi');
ylabel('F', 'Rotation', 0);
legend({'Fbulk', 'Fsep'});
title('Flory-Huggins Free Energy of Mixing');
subtitle(['\chi = ', sprintf('%.3f ', chi_list)]);
print('FigFloryHugginsFreeEnergyOfMixing.png', '-dpng');

% Figure 2: Flory-Huggins phase diagram for a range of CHI values
figure(2);
n = 400;
phi_vals = linspace(0, 1, n);
chi_vals = 1 / 100 * linspace(1.5, 2.0, n);
[Phi, Chi] = meshgrid(phi_vals, chi_vals);
F = a * Phi .* log(Phi) + b * (1 - Phi) .* log(1 - Phi) + Chi .* Phi .* (1 - Phi);
F(:, 1) = 0;
F(:, end) = 0;

% Plot contours for F 
contourf(phi_vals, chi_vals, F, 10, 'k', 'LineWidth', 1); hold on;
for i = 1:n
    k = convhull(phi_vals, F(i, :));
    k = k(2:end-1);
    [~, index1] = max(diff(k));
    index2 = k(index1 + 1);
    phi1 = phi_vals(index1);
    phi2 = phi_vals(index2);
    if phi1 > 0 % Plot common tangent points 
        plot(phi1, chi_vals(i), '*w');
        plot(phi2, chi_vals(i), '*w');
    end
end

% Additional contour lines for chemical potential and its derivative
FPrime = a * log(Phi) - b * log(1 - Phi) + a - b + Chi .* (1 - 2 * Phi);
contour(phi_vals, chi_vals, FPrime, [0 0], 'c-', 'LineWidth', 2);
FPrimePrime = a ./ Phi - b ./ (1 - Phi) - 2 * Chi;
contour(phi_vals, chi_vals, FPrimePrime, [0 0], 'r-', 'LineWidth', 2);

% Graph formatting for Figure 2
set(gca, 'YDir', 'normal');
colormap(turbo);
xlabel('\phi');
ylabel('\chi', 'Rotation', 0);
cb = colorbar();
ylabel(cb, 'F', 'FontSize', 16, 'Rotation', 0);
zlabel('F', 'Rotation', 0);
title('Flory-Huggins Phase Diagram');
print('FigFloryHugginsPhaseDiagram.png', '-dpng');
return


 

