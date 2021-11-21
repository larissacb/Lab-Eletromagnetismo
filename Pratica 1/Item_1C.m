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
%%Item c - Obter o gráfico de cores que mostre a intensidade do campo
%%elétrico
x = dominio1:5e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico
y = dominio1:5e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico

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

%Carga 2
E2x = (k*q2)*(X-posx2)./mod2;
E2y = (k*q2)*(Y-posy2)./mod2;

%Campo eletrico total em cada uma das direcoes
E1 = E1x+E1y;
E2 = E2x+E2y;
%%
%Plotando o gráfico
figure(1)
contourf(abs(E1+E2)), colorbar; %Gráfico em 2D
title("Módulo da Intensidade do Campo Elétrico"); %Título

figure(2)
surf(abs(E1+E2)), colorbar; %Gráfico em 3D
title("Módulo da Intensidade do Campo Elétrico"); %Título