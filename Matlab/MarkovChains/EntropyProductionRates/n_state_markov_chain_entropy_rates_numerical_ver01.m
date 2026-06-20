%% Entropy of an N-State Markov Chain
%
% This script calculates and visualizes entropy rates and entropy production
% for a finite state continuous-time Markov chain.
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

%% Define the transition rate matrix (Q)
% Uncomment one of the following 
% N = 4; Q = exprnd(1,N,N);
N = 3; Q = [0, 2, 1 ;   1, 0, 2 ; 2, 1, 0 ];
% N = 2; Q = [0, 1; 2, 0];

% Ensure rows of Q sum to zero 
for i = 1:N
    Q(i, i) = -sum(Q(i, :));
end

% Display the transition rate matrix
disp('Transition rate matrix (Q):');
Q

%% Initial probabilities
p0 = zeros(1, N); p0(1) = 1; % Start with state 1

p0 = p0 / sum(p0); % Normalize probability row vector 
t = linspace(1e-3, 0.8, 1e4); % Time vector
pp = expmv(Q', p0', t)'; % Compute probabilities over time

%% Compute entropy and entropy production rates
[ sigma_1, sigma_2, sigma_e1, sigma_e2, sigma_i1, sigma_i2 ] = deal(zeros(1, length(t)));

for i = 1:length(t)
    % Joint probability matrix P (Pm for m, Pn for n)
    P = pp(i, :)' * ones(1, N);
    
    % Entropy production rate calculations
    S1 = -P .* Q .* log2(P');
    S2 = P' .* Q' .* log2(P' ./ P);
    sigma_1(i) = sum(S1, 'all');
    sigma_2(i) = sum(S2, 'all');

    % Exchange entropy production rates
    Se1 = -0.5 * (P' .* Q' - P .* Q) .* log2(Q' ./ Q);
    Se2 = -P' .* Q' .* log2(Q' ./ Q);
    sigma_e1(i) = sum(Se1, 'all');
    sigma_e2(i) = sum(Se2, 'all');

    % Interaction entropy production rates
    Si1 = 0.5 * (P' .* Q' - P .* Q) .* log2(P' .* Q' ./ P ./ Q);
    Si2 = P' .* Q' .* log2(P' .* Q' ./ P ./ Q);
    sigma_i1(i) = sum(Si1, 'all');
    sigma_i2(i) = sum(Si2, 'all');
end

% Shannon entropy
H = -sum(pp .* log2(pp + eps), 2);  % eps prevents log2(0)

%% Plot probabilities and entropy
figure(1);

% Subplot 1: Probabilities and Shannon entropy
subplot(2, 1, 1);
plot(t, pp, '-', t, H, 'b-');
xlabel('Time, t');
ylabel('Probabilities / Entropy');
legend(["p_" + (1:N), "H"], 'Location', 'best');
grid on;
title('Probabilities and Shannon Entropy');

% Subplot 2: Entropy production rate
dt = t(2) - t(1); 
sigma__check = diff(H) / dt;
t_check = t(2:end);
subplot(2, 1, 2);
plot(t, sigma_2, 'b', t_check, sigma__check, 'c--');
title('Check: \sigma = dH/dt');
xlabel('Time, t');
ylabel('Entropy Production Rate');
legend({'\sigma', 'dH/dt'}, 'Location', 'best');

sgtitle(['CTMC (N = ', num2str(N), '): Entropy and Entropy Production Rates']);
print([mfilename, '-fig-1.png'], '-dpng');

%% Plot entropy production rates
figure(2);
semilogx(t, sigma_1, 'c', t, sigma_2, 'k--'); hold on;
plot(t, sigma_e1, 'g', t, sigma_e2, 'k--');  
plot(t, sigma_i1, 'r', t, sigma_i2, 'k--');  
legend({'\sigma_1', '\sigma_2', '\sigma_e1', '\sigma_e2', '\sigma_i1', '\sigma_i2'}, 'Location', 'best');
xlabel('Time, t');
ylabel('Entropy Production Rates');
grid on;
title(['CTMC (N = ', num2str(N), '): Entropy Production Rates']);
print([mfilename, '-fig-2.png'], '-dpng');

%% Display final entropy production rates
disp('Final entropy production rates:');
disp('    sigma     sigma_i  sigma_e');
disp([sigma_1(end), sigma_i1(end), sigma_e1(end); 
      sigma_2(end), sigma_i2(end), sigma_e2(end)]);



