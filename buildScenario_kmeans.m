clc
clear
close all
% Programa para extrair cenários com o kmeans
%
%% Leitura das séries
load('data/Series_Merrick_sep_pu.mat', 'demand', 'wind', 'solar'); 
%
%% Organizando cenário
data = [demand wind(:,1)];  % Demand e 1 wind
% data = [demand wind(:,[1 2])];  % Exemplo com demand e 2 wind
% data = solar(:, 1);  % Exemplo com 1 solar
%
%% Gerar cenários
ncen = 10;  % Número de cenários (Parâmetro do kmeans)
[nobs, nser] = size(data);  % Número de observações e séries em data
%
% k-means
idx = kmeans(data, ncen, 'MaxIter', 10000);  % Lista de índices de cenários para cada observação
%
% Montagem dos cenários
sumP = zeros(ncen, nser); % Acumulador de potência gerada e demanda
conP = zeros(ncen, 1); % Contador de apairições no centróide
tbl = zeros(ncen, nser+1); % Tabela de cenários
%
% Varrendo todas as observações
for iobs = 1:nobs
    kcen = idx(iobs);  % Cenário corrente
    sumP(kcen, :) = sumP(kcen, :) + data(iobs, :);  % Acumula despacho eólico e demanda
    conP(kcen) = conP(kcen) + 1;  % Conta número de observações no cenário corrente
end
%
% Cálculo da demanda e despacho médios em cada série
for iser = 1:nser
    tbl(:, iser) = sumP(:, iser)./conP;  
end
%
% Cálculo da probabilidade
tbl(:,nser+1) = conP/nobs;
%
% Organizando tabela por ordem decrescente de probabilidade
[pB,I] = sort(tbl(:, nser+1),'descend');
grouped_data = [tbl(I, 1:nser) pB];
disp(grouped_data)
%
csvwrite('results/grouped_data_kmeans.csv',grouped_data)
disp('The results were saved in results/grouped_data_kmeans.csv')


