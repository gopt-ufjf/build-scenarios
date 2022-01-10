clc
clear
close all
rng(1);  % Seed for reproducibility
%
%% Simulation parameters
% Loading historical data
load('data/Series_Merrick_sep_pu.mat', 'demand', 'wind', 'solar');
%% Organizando cenário
data = [demand wind(:,1)];  % Demand e 1 wind
% data = [demand wind(:,[1 2])];  % Exemplo com demand e 2 wind
% data = solar(:, 1);  % Exemplo com 1 solar
%
%% m-ISODATA options (see help misodata)
options = struct(...
    'SimName', 'grouped_data_mISODATA',...  % Simulation name used to save the scenarios in a .csv file
    'ResultsPath', 'results/',...  % Path to results folder
    'Display', 'final', ...  % No displays
    'SaveFlag', true);  % Flag to save scenarios data as a .csv file
%
%% Calling m-ISODATA
[IDX, C, PROB, OUTPUT] = misodata(data, options);