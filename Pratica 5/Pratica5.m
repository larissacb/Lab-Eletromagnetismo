%Laboratorio de Eletromagnetismo - Eng. Eletrica
%Pratica 05 - Calculo de campos devido a uma LT trifasica
%25/11/2021
%Gabriel Arantes e Larissa Braga
clc;
clear all;
close all;
%%
%Dados do problema
%Dados da LT
dist = 8.4; %Distancia entre cada um dos cabos das fases
h = [12, 8.1, 7.4]; %Altura da LT em relacao a terra
S = 1090e6; %Potencia aparente
VL = 345e3; %Tensao de linha da LT
seq = [0, -120, 120].*(pi/180); %Sequencia de fases abc em rad
r = 0.72; %Raio dos condutores
dominio = [-25, 25]; %Dominio do problema - Comprimento da LT

%Constantes gerais
u0 = 4e-7*pi; %Constante de permissividade magnetica no vacuo
eps = 8.854e-12; %Constante de permissividade eletrica no vacuo
%%
%Calcular posicao exata de cada um dos condutores
dbx = 0; %Considerando que a fase B esta na origem
dx = [dbx-2*r-dist, dbx, dbx+2*r+dist]; %Posicao de cada uma das fases abc
x = dominio(1):0.1:dominio(2); %Criando um vetor de pontos
%%
for i=1:length(h)
    %Calculo do Campo Eletrico gerado pelas 3 fases
    figure()
    Etotal = 0;
    for fase=1:size(dx,2)%Percorendo todas as fases
        Vret = VL*(cos(seq(fase))+j*sin(seq(fase))); %Convertendo tensao de linha para notacao retangular
        ro = (2*pi*eps*Vret)/log(2*h(i)/r); %Calculo da densidade de carga    
        E = ((-ro./(pi.*eps)).*(h(i)./((x-dx(fase)).^2+h(i).^2)))/sqrt(3); %Calculo do campo eletrico
        Etotal = Etotal+E;
        plot(x,abs(E)),grid; %Plotando o grafico
        hold on
    end
    plot(x,abs(Etotal));
    hold off
    title("Campo Elétrico");
    xlabel("Posição [m]");
    ylabel("Campo Elétrico [V/m]");
    legend("Fase A","Fase B","Fase C", "Total");
    if i==1
        suptitle("Linha de Transmissão a 12m do solo");
    elseif i==2
        suptitle("Linha de Transmissão a 8.1m do solo");
    else
        suptitle("Linha de Transmissão a 7.4m do solo");
    end
    %%
    %Calculo da Densidade do Fluxo Magnetico gerado pelas 3 fases
    Btotal = 0;
    figure()
    for fase=1:size(dx,2)%Percorendo todas as fases
        Vret = VL*(cos(seq(fase))+j*sin(seq(fase))); %Convertendo para notacao retangular a tensao de linha. Angulo convertido para radianos para usar a funcao
        IL = S/(sqrt(3)*Vret); %Calculo da corrente
        B = ((u0*IL/pi).*(h(i)./((x-dx(fase)).^2+h(i).^2)))/sqrt(3); %Calculo da densidade do fluxo magnetico
        Btotal = Btotal+B;
        plot(x,abs(B)),grid; %Plotando o grafico
        hold on
    end
    plot(x,abs(Btotal));
    hold off
    title("Densidade de Fluxo Magnético");
    xlabel("Posição [m]");
    ylabel("Densidade de Fluxo Magnético [Wb/m^2]");
    legend("Fase A","Fase B","Fase C", "Total");
    if i==1
        suptitle("Linha de Transmissão a 12m do solo");
    elseif i==2
        suptitle("Linha de Transmissão a 8.1m do solo");
    else
        suptitle("Linha de Transmissão a 7.4m do solo");
    end
end
