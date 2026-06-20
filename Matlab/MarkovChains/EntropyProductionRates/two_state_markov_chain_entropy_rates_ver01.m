%% Entropy Rates of a Two-State Markov Chain
%
% This script calculates and visualizes entropy rates and entropy production
% for a continuous-time two-state Markov chain.
%
% Author:  Greg Conradi Smith
% 
% January 24, 2025 - Version 01 - Original 
%
% Reference: Cocconi, L., Garcia-Millan, R., Zhen, Z., Buturca, B., &
% Pruessner, G. (2020). Entropy production in exactly solvable systems.
% Entropy, 22(11), 1252.
%
% https://www.mdpi.com/1099-4300/22/11/1252
%

% Clear workspace and set default properties
clear; clc; close all;
set(0, 'DefaultLineLineWidth', 1.5);

% Transition rates
a = 1; 
b = 2;

% Steady-state probabilities
p1ss = b / (a + b);
p2ss = a / (a + b);

% Initial probabilities
p1init = 1;
p2init = 1 - p1init;

% Time vector
t = linspace(0, 0.8, 1e3);

% Time-dependent probabilities
p1 = p1ss + (p1init - p1ss) * exp(-(a + b) * t);
p2 = p2ss + (p2init - p2ss) * exp(-(a + b) * t);

% Shannon entropy
h = -p1 .* log2(p1) - p2 .* log2(p2);

% Entropy production rates
sigma = (a * p1 - b * p2) .* log2(p1 ./ p2);         % Total entropy production rate
sigmae = -(a * p1 - b * p2) .* log2(a / b);          % External entropy production rate
sigmai = (a * p1 - b * p2) .* log2((a * p1) ./ (b * p2)); % Internal entropy production rate

% Check entropy production rate using h derivative
dt = t(2) - t(1);
sigma_check = diff(h) / dt;
t_check = t(2:end);

% Plot probabilities and entropy
figure(1)
subplot(2, 1, 1);
plot(t, p1, 'k-', t, p2, 'k--', t, h, 'b-');
xlabel('Time, t');
ylabel('Probabilities / Entropy');
legend({'p_1', 'p_2', 'h'}, 'Location', 'best');
grid on;
title('Probabilities and Shannon Entropy');

% Plot entropy production rates
subplot(2, 1, 2);
plot(t, sigmae, 'b', t, sigmai, 'g', t, sigma, 'r', t, sigmae + sigmai, 'c--'); hold on;
plot(t_check, sigma_check, 'k+', 'MarkerIndices', 1:100:length(t_check));
xlabel('Time, t');
ylabel('Entropy Production Rates');
legend({'\sigma_e', '\sigma_i', '\sigma', '\sigma_e + \sigma_i', 'dh/dt'}, 'Location', 'best');
grid on;
title('Entropy Production Rates');

% Add overall title
sgtitle('Two-State CTMC: Entropy and Entropy Production Rates');
print([mfilename '-fig-1.png'], '-dpng');

% Check against analytical result
figure(2)
rinit = a * p1init - b * p2init;
sigmae_analytical = -rinit .* exp(-(a + b) * t) * log2(a / b);
sigmai_analytical = rinit .* exp(-(a + b) * t) .* log2((1 + rinit / b * exp(-(a + b) * t)) ./ (1 - rinit / a * exp(-(a + b) * t)));
sigma_analytical = sigmae_analytical + sigmai_analytical;

% Plot entropy production rates
loglog(t, sigmae, 'b', t, sigmai, 'g', t, sigma, 'r'); hold on;
loglog(t, sigmae_analytical, 'c--', t, sigmai_analytical, 'k--', t, sigma_analytical, 'k--');
xlabel('Time, t');
ylabel('Entropy Production Rates');
legend({'\sigma_e', '\sigma_i', '\sigma', '\sigma_e check', '\sigma_i check', '\sigma check'}, 'Location', 'best');
grid on;
title('Check against Analytical Result');
print([mfilename '-fig-2.png'], '-dpng');

