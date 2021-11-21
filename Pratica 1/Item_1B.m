%Laboratorio de Eletromagnetismo - Eng. Eletrica
%Pratica 01 - Lei de Coulomb e Campos Eletricos
%29/10/2021
%Gabriel Arantes e Larissa Braga
%Questao 1 - Dipolo Eletrico

clc;
clear all;
close all;
format long e; %Definicao do tipo de variavel usada
%%
%Definicao das constantes

q1 = 1e-9; %Carga 1
q2 = -1e-9; %Carga 2

posx1 = 60e-2; posy1 = 0; %Localizacao da Carga 1 no eixo x e y
posx2 = -60e-2; posy2 = 0; %Localizacao da Carga 2 no eixo x e y

e0 = 8.854e-12; %Permissividade eletrica no vacuo
k = 1/(4*pi*e0); %Constante Lei de Coulomb

dominio1 = -90e-2; %Limite inferior do dominio a ser analisado
dominio2 = 90e-2; %Limite superior do dominio a ser analisado

%%
%%Item b - Tracar no plano xy as linhas de campo associadas ao dipolo
%%eletrico
x = dominio1:20e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico
y = dominio1:20e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico

[X,Y] = meshgrid(x,y);

%Calculando os vetores distancia
R1x = X-posx1;
R1y = Y-posy1;

R2x = X-posx2;
R2y = Y-posy2;

%Calculando o modulo dos vetores distancia
mod1 = (sqrt(R1x.^2 + R1y.^2)).^3;
mod2 = (sqrt(R2x.^2 + R2y.^2)).^3;

%Calculando os vetores de campo eletrico em cada uma das direcoes
%Carga 1
E1x = (k*q1)*(X-posx1)./mod1;
E1y = (k*q1)*(Y-posy1)./mod1;
modE1 = sqrt(E1x.^2+E1y.^2);

%Carga 2
E2x = (k*q2)*(X-posx2)./mod2;
E2y = (k*q2)*(Y-posy2)./mod2;
modE2 = sqrt(E2x.^2+E2y.^2);

%Campo eletrico total em cada uma das direcoes
Ex = E1x+E2x;
Ey = E1y+E2y;
modE = sqrt(Ex.^2+Ey.^2);
%%
%Plotando os graficos
%Carga positiva e negativa (separadas)
figure(1)
subplot(1,2,1); %Dividindo a tela do gráfico. A 1a figura ocupa a 1a posição
quiver(X, Y, E1x./modE1, E1y./modE1, 'r', 'linewidth', 1.5),grid; %Plotando as linhas do campo da carga positiva
axis([-1.5 1.5 -1.5 1.5]); %Padronizando o tamanho do gráfico
title("Carga Positiva"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y

subplot(1,2,2); %Dividindo a tela do gráfico. A 2a figura ocupa a 2a posição
quiver(X, Y, E2x./modE2, E2y./modE2, 'b', 'linewidth', 1.5),grid; %Plotando as linhas do campo da carga negativa
axis([-1.5 1.5 -1.5 1.5]); %Padronizando o tamanho do gráfico
title("Carga Negativa"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y
suptitle('Campo Elétrico Gerado por um Dipolo Elétrico'); %Título geral da figura 1

%Campo resultante
figure(2)
quiver(X, Y, Ex./modE, Ey./modE, 'm', 'linewidth', 1.5),grid; %Plotando as linhas do campo resultante
axis([-1.5 1.5 -1.5 1.5]); %Padronizando o tamanho do gráfico
title("Campo Elétrico Total Gerado por um Dipolo Elétrico"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y
