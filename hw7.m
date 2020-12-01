% HW 7 Coding

% Gravity anomaly of a sediment covered ridge

clear all; close all;

lambda_f1 = 5*1000; % flexural wavelength (m)
lambda_f2 = 30*1000; % flexural wavelength (m)
D1 = 1.8e21; % flexural rigidity (N m)
D2 = 3.2e23; % flexural rigidity (N m)

[gr] = computing_ridge_grav(D1,D2,lambda_f1,lambda_f2);








