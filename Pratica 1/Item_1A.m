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

posx1 = 60e-2; %Localizacao da Carga 1 no eixo x
posx2 = -60e-2; %Localizacao da Carga 2 no eixo x

e0 = 8.854e-12; %Permissividade eletrica no vacuo
k = 1/(4*pi*e0); %Constante Lei de Coulomb

dominio1 = -90e-2; %Limite inferior do dominio a ser analisado
dominio2 = 90e-2; %Limite superior do dominio a ser analisado

%%
%%Item a - Vetor intensidade do campo eletrico no eixo x
x = dominio1:0.001e-2:dominio2; %Vetor com pontos do dominio para tracar o grafico

%Calculo do denominador da lei de Coulomb para as duas cargas do dipolo
d1x = (sqrt((x-posx1).^2)).^3; 
d2x = (sqrt((x-posx2).^2)).^3;

E1x = ((k*q1)*(x-posx1))./(d1x);
E2x = ((k*q2)*(x-posx2))./(d2x);

E = E1x+E2x;

figure(1)
plot(x,E1x, '-b', 'linewidth', 1.5),grid;
plot(x,E2x, '-r', 'linewidth', 1.5),grid;
title("Módulo do Campo Elétrico Gerado por um Dipolo Elétrico");
xlabel("Distância (cm)");
ylabel("Campo Elétrico (N/m)");



%%
