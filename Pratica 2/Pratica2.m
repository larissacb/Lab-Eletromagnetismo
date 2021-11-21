%%Laboratorio de Eletromagnetismo - Eng. Eletrica
%%Pratica 02 - Capacitancia atraves da equacao de Laplace pelo metodo das
%%diferencas finitas
%05/11/2021
%Gabriel Arantes e Larissa Braga

clc;
clear all;
close all;
format long e; %Definicao do tipo de variavel usada
%%
%Definicao das constantes
%FR4
xmaxf = 15e-2;
ymaxf = 20e-2;
zmaxf = 1.6e-3;
epsf = 4.3*8.854e-12;

%Duroid
xmaxd = 23e-2;
ymaxd = 30.6e-2;
zmaxd = 6.32e-3;
epsd = 2.2*8.854e-12;

%Potenciais elétricos 
V1 = 1; %Placa superior - Dado do relatorio = 1
V2 = 0; %Placa inferior - Dado do relatorio = 0

N = 10; %Constante para definicao do tamanho da matriz de pontos

%%
%Equacao de Laplace
v = zeros(N, N, N); %Matriz 3D

%Aplicando as condicoes iniciais
%Condicao de Dirichelet
v(:,:,N) = V1; 
v(:,:,1) = V2; 
%%
for n=1:1000 %Quantidade de iteracoes do metodo
    %Percorrendo a matriz 3D ignorando o calculo do potencial eletrico nas
    %bordas
    for i=2:N-1 %Linhas
        for j=2:N-1 %Colunas
            for k=2:N-1 %Profundidade
                %Equacao de Laplace pelo metodo das diferencas finitas
                v(i,j,k) = (v(i+1,j,k)+v(i-1,j,k)+v(i,j+1,k)+v(i,j-1,k)+v(i,j,k+1)+v(i,j,k-1))/6;
            end
        end
    end
    %Como a superficie e equipotencial, nas bordas os elementos vizinhos
    %sao iguais
    %Condicao de Neumann
    v(1,:,:) = v(2,:,:);
    v(:,1,:) = v(:,2,:);
    v(N,:,:) = v(N-1,:,:);
    v(:,N,:) = v(:,N-1,:);
end
%%
%O campo eletrico e definido como -gradiente do potencial eletrico
%Como existem superficies equipotenciais nos eixos x e y, as derivadas
%parciais nessas direcoes sao nulas. Logo, sobra apenas a componente na
%direcao z.
%Pelo metodo das diferencas finitas:
%Calculo do campo eletrico

%O campo eletrico vai ser constante em todos os pontos. Logo, basta
%calcular o campo eletrico em 1 ponto e todas as outras grandezas

Ef = -(v(N,N,N)-v(N-1,N-1,N-1))/(zmaxf/N); %Para o capacitor com material FR4
Ed = -(v(N,N,N)-v(N-1,N-1,N-1))/(zmaxd/N); %Para o capacitor com material Duroid

%Calculo do Rô: densidade de carga
Rof = epsf*Ef; %Para o capacitor com material FR4
Rod = epsd*Ed; %Para o capacitor com material Duroid

%Calculo da carga do capacitor
Qf = Rof*(xmaxf*ymaxf); %Para o capacitor com material FR4
Qd = Rod*(xmaxd*ymaxd); %Para o capacitor com material Duroid

%Calculo da capacitancia
Cf = abs(Qf)/(V1-V2); %Para o capacitor com material FR4
Cd = abs(Qd)/(V1-V2); %Para o capacitor com material Duroid

%Apresentação na tela dos resultados obtidos
fprintf("Capacitância com o material FR4: %.4e F\n", Cf);
fprintf("Capacitância com o material Duroid: %.4e F\n", Cd);

%%
%Plotando o corte longitudinal da supeficie equipotencial
vplot(:,:) = v(N/2,:,:);

figure(1)
contourf(vplot');
title("Variação do Potencial Elétrico entre as Placas");
colormap(jet(10))
shading interp
colorbar;