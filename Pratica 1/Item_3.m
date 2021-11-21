%Laboratorio de Eletromagnetismo - Eng. Eletrica
%Pratica 01 - Lei de Coulomb e Campos Eletricos
%29/10/2021
%Gabriel Arantes e Larissa Braga
%Questao 3 - 4 Cargas Eletricas
clc
clear all
close all

%Definicao das constantes
colordef white
q1 = 1e-9; %Carga 1
q2 = -1e-9; %Carga 2
q3 = 1e-9; %Carga 3
q4 = -1e-9; %Carga 4

posx1 = 30e-2; posy1 = 30e-2; %Localizacao da Carga 1 no eixo x e y
posx2 = -30e-2; posy2 = 30e-2; %Localizacao da Carga 2 no eixo x e y
posx3 = -30e-2; posy3 = -30e-2; %Localizacao da Carga 3 no eixo x e y
posx4 = 30e-2; posy4 = -30e-2; %Localizacao da Carga 4 no eixo x e y

e0 = 8.854e-12; %Permissividade eletrica no vacuo
k = 1/(4*pi*e0); %Constante Lei de Coulomb

dominio1 = -90e-2; %Limite inferior do dominio a ser analisado
dominio2 = 90e-2; %Limite superior do dominio a ser analisado

%%
%%Item b - Tracar no plano xy as linhas de campo associadas ao dipolo
%%eletrico
x = dominio1:10e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico
y = dominio1:10e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico

[X,Y] = meshgrid(x,y);

%Calculando os vetores distancia
R1x = X-posx1;
R1y = Y-posy1;

R2x = X-posx2;
R2y = Y-posy2;

R3x = X-posx3;
R3y = Y-posy3;

R4x = X-posx4;
R4y = Y-posy4;

%Calculando o modulo dos vetores distancia
mod1 = (sqrt(R1x.^2 + R1y.^2)).^3;
mod2 = (sqrt(R2x.^2 + R2y.^2)).^3;
mod3 = (sqrt(R3x.^2 + R3y.^2)).^3;
mod4 = (sqrt(R4x.^2 + R4y.^2)).^3;

%Calculando os vetores de campo eletrico em cada uma das direcoes
%Carga 1
E1x = (k*q1)*(X-posx1)./mod1;
E1y = (k*q1)*(Y-posy1)./mod1;
E1 = E1x+E1y;
modE1 = sqrt(E1x.^2+E1y.^2);

%Carga 2
E2x = (k*q2)*(X-posx2)./mod2;
E2y = (k*q2)*(Y-posy2)./mod2;
E2 = E2x+E2y;
modE2 = sqrt(E2x.^2+E2y.^2);

%Carga 3
E3x = (k*q3)*(X-posx3)./mod3;
E3y = (k*q3)*(Y-posy3)./mod3;
E3 = E3x+E3y;
modE3 = sqrt(E3x.^2+E3y.^2);

%Carga 4
E4x = (k*q4)*(X-posx4)./mod4;
E4y = (k*q4)*(Y-posy4)./mod4;
E4 = E4x+E4y;
modE4 = sqrt(E4x.^2+E4y.^2);

%Campo eletrico total em cada uma das direcoes
Ex = E1x+E2x+E3x+E4x;
Ey = E1y+E2y+E3y+E4y;
modE = sqrt(Ex.^2+Ey.^2);
%%
%Plotando os graficos
%Cada uma das cargas separadas
figure(2)
subplot(2,2,1); %Dividindo a tela do gráfico. A 1a figura ocupa a 1a posição
quiver(X, Y, E1x./modE1, E1y./modE1, 'r', 'linewidth', 1.5),grid; %Plotando as linhas do campo da carga 1
axis([-1 1 -1 1]); %Padronizando o tamanho do gráfico
title("Carga 1 | 1nC (30,30) cm"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y

subplot(2,2,2); %Dividindo a tela do gráfico. A 2a figura ocupa a 2a posição
quiver(X, Y, E2x./modE2, E2y./modE2, 'b', 'linewidth', 1.5),grid; %Plotando as linhas do campo da carga 2
axis([-1 1 -1 1]); %Padronizando o tamanho do gráfico
title("Carga 2 | -1nC (-30,30) cm"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y

subplot(2,2,3); %Dividindo a tela do gráfico. A 3a figura ocupa a 3a posição
quiver(X, Y, E3x./modE3, E3y./modE3, 'g', 'linewidth', 1.5),grid; %Plotando as linhas do campo da carga 3
axis([-1 1 -1 1]); %Padronizando o tamanho do gráfico
title("Carga 3 | 1nC (-30,-30) cm"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y

subplot(2,2,4); %Dividindo a tela do gráfico. A 4a figura ocupa a 4a posição
quiver(X, Y, E2x./modE2, E2y./modE2, 'm', 'linewidth', 1.5),grid; %Plotando as linhas do campo da carga 4
axis([-1 1 -1 1]); %Padronizando o tamanho do gráfico
title("Carga 4 | -1nC (30,-30) cm"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y
suptitle('Campo Elétrico Gerado por 4 Cargas Elétricas');
%Campo resultante
figure(3)
quiver(X, Y, Ex./modE, Ey./modE, 'k', 'linewidth', 1.5),grid; %Plotando as linhas do campo resultante
axis([-1 1 -1 1]); %Padronizando o tamanho do gráfico
title("Campo Elétrico Total Gerado por 4 Cargas Elétricas"); %Título
xlabel("Distância (cm)"); %Legenda eixo x
ylabel("Campo Elétrico (N/m)"); %Legenda eixo y

%%
%%Item c - Obter o gráfico de cores que mostre a intensidade do campo
%%elétrico

figure(4)
contourf(modE), colorbar; %Gráfico em 2D
title("Módulo da Intensidade do Campo Elétrico"); %Título

figure(5)
surf(modE); %Gráfico em 3D
title("Módulo da Intensidade do Campo Elétrico"),colorbar; %Título