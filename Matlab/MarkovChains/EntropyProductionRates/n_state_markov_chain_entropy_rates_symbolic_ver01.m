%% Entropy of an N-State Markov Chain - Symbolic
%
% This script calculates the entropy and entropy rates of a symbolic
% N-state Markov chain. It evaluates steady-state probabilities and
% steady-state entropy production rates.
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

% Clear environment and initialize symbolic variables
clear; clc; close all;

syms a b c a12 a13 a21 a23 a31 a32 real positive

% Define symbolic generator matrices - uncomment one of the following examples
%
% N = 2; Q = [0, a; b, 0];
%
% N = 3; Q = [0, a12, a13; a21, 0, a23; a31, a32, 0];
%

N = 3; Q = [0, a, b; b, 0, a; a, b, 0];

% Initialize the generator matrix for general N
for i = 1:N
    Q(i, i) = 0;                
    Q(i, i) = -sum(Q(i, :));    % Ensure row sum is zero
end
Q

% Steady-state calculation
B = zeros(N + 1, 1); B(end) = 1;   % Add constraint for normalization
Q1 = [Q, ones(N, 1)];              % Augmented matrix for solving
p = Q1' \ B;                       % Solve for steady-state probabilities
p = p';                            % Convert to row vector 

% Display steady-state probabilities
p

% Steady-state Shannon entropy calculation
H = -simplify(sum(p .* log(p), 2));

% Transition probability matrix
P = (ones(N, 1) * p)'; % P(i, j) is stationary probability of i * transition rate from j to i

% Calculate entropy production rates - 1 & 2 indicate equivalent matrix analytic forms
S1 = -P .* Q .* log(P');            
S2 = P' .* Q' .* log(P' ./ P);      

sigma_1 = simplify(sum(S1, 'all'));
sigma_2 = simplify(sum(S2, 'all'));

% Verify equivalence of sigma_1 and sigma_2
disp(['isAlways(sigma_1 == sigma_2) = ', num2str(isAlways(sigma_1 == sigma_2))]);

% Calculate steady-state external entropy production rate
Se_1 = -0.5 * (P' .* Q' - P .* Q) .* log(Q' ./ Q);
sigma_e_1 = simplify(sum(Se_1, 'all'));
Se_2 = -P' .* Q' .* log(Q' ./ Q);
sigma_e_2 = simplify(sum(Se_2, 'all'));

disp(['isAlways(sigma_e_1 == sigma_e_2) = ', num2str(isAlways(sigma_e_1 == sigma_e_2))]);

% Calculate steady-state internal entropy production rate
Si_1 = 0.5 * (P' .* Q' - P .* Q) .* log(P' .* Q' ./ P ./ Q);
sigma_i_1 = simplify(sum(Si_1, 'all'));
Si_2 = P' .* Q' .* log(P' .* Q' ./ P ./ Q);
sigma_i_2 = simplify(sum(Si_2, 'all'));

disp(['isAlways(sigma_i_1 == sigma_i_2) = ', num2str(isAlways(sigma_i_1 == sigma_i_2))]);

% Steady-state entropy production rates
sigma = sigma_2;
sigma_e = sigma_e_2;
sigma_i = sigma_i_2;

% Display results
sigma
sigma_e
sigma_i

return
