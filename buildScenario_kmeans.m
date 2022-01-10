clc
clear
close all
% Programa para extrair cen�rios com o kmeans
%
%% Leitura das s�ries
load('data/Series_Merrick_sep_pu.mat', 'demand', 'wind', 'solar'); 
%
%% Organizando cen�rio
data = [demand wind(:,1)];  % Demand e 1 wind
% data = [demand wind(:,[1 2])];  % Exemplo com demand e 2 wind
% data = solar(:, 1);  % Exemplo com 1 solar
%
%% Gerar cen�rios
ncen = 10;  % N�mero de cen�rios (Par�metro do kmeans)
[nobs, nser] = size(data);  % N�mero de observa��es e s�ries em data
%
% k-means
idx = kmeans(data, ncen, 'MaxIter', 10000);  % Lista de �ndices de cen�rios para cada observa��o
%
% Montagem dos cen�rios
sumP = zeros(ncen, nser); % Acumulador de pot�ncia gerada e demanda
conP = zeros(ncen, 1); % Contador de apairi��es no centr�ide
tbl = zeros(ncen, nser+1); % Tabela de cen�rios
%
% Varrendo todas as observa��es
for iobs = 1:nobs
    kcen = idx(iobs);  % Cen�rio corrente
    sumP(kcen, :) = sumP(kcen, :) + data(iobs, :);  % Acumula despacho e�lico e demanda
    conP(kcen) = conP(kcen) + 1;  % Conta n�mero de observa��es no cen�rio corrente
end
%
% C�lculo da demanda e despacho m�dios em cada s�rie
for iser = 1:nser
    tbl(:, iser) = sumP(:, iser)./conP;  
end
%
% C�lculo da probabilidade
tbl(:,nser+1) = conP/nobs;
%
% Organizando tabela por ordem decrescente de probabilidade
[pB,I] = sort(tbl(:, nser+1),'descend');
grouped_data = [tbl(I, 1:nser) pB];
disp(grouped_data)
%
csvwrite('results/grouped_data_kmeans.csv',grouped_data)
disp('The results were saved in results/grouped_data_kmeans.csv')


