clear all; close all; clc
N = 1e3;
raz = 1e5;
EbNo_BOB = 1:0.5:20;
C_mean_BOB = zeros(1, 20);
ReHser = load('C:\Users\Ubermensch\Desktop\Диплом\Задания\Матрицы_Якуба\ReHser.dat','r');
ImHser = load('C:\Users\Ubermensch\Desktop\Диплом\Задания\Матрицы_Якуба\ImHser.dat','r');
ReHser1 = load('C:\Users\Ubermensch\Desktop\Диплом\Задания\Матрицы_Якуба\ReHser1.dat','r');
ImHser1 = load('C:\Users\Ubermensch\Desktop\Диплом\Задания\Матрицы_Якуба\ImHser1.dat','r');
H1 = ReHser+1j*ImHser;
H2 = ReHser1+1j*ImHser1;
EbNo_EVA = 1:0.5:20; % нюанс. 
% EbNo_EVA_ones = zeros(1,1);
% EbNo_EVA_new = [matrix_zero_front EbNo_EVA];
% EbNo_EVA_new_new = [EbNo_EVA_new EbNo_EVA_ones];
C_BOB = zeros(1,length(EbNo_BOB));
C_EVA = zeros(1,length(EbNo_EVA));
Capacity_secrecy = zeros(length(EbNo_BOB),length(EbNo_EVA));
Capacity_secrecy1 = zeros(1,length(EbNo_BOB));
for ii = 1:length(EbNo_BOB)
    for kk = 1:length(EbNo_EVA)
        for jj = 1:length(ReHser)
            C_BOB = log2(1+(abs(H1(jj)).^2)*EbNo_BOB(ii));
            C_EVA = log2(1+(abs(H2(jj)).^2)*EbNo_EVA(kk));
            Capacity_secrecy1(jj) = max(C_BOB - C_EVA,0);
        end   
        Capacity_secrecy(kk,ii) = mean(Capacity_secrecy1);
    end
    %C_mean_BOB(ii) = mean(C_BOB);
    %C_mean_EVA(ii) = mean(C_EVA);
end
[X, Y] = meshgrid(EbNo_BOB, EbNo_EVA);
contourf(X,Y,Capacity_secrecy)
contourcbar
title('Capacity Secrecy')
xlabel('SNR BOB')
ylabel('SNR EVA')