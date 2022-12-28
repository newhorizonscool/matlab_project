clear all; close all; clc
N = 1e3;
raz = 1e5;
EbNo_BOB = 1:0.5:20;
C_mean_BOB = zeros(1, 20);
matrix_zero_front = zeros(1,4);
EbNo_EVA = 1:0.5:20; % нюанс. 
EbNo_EVA_ones = zeros(1,1);
EbNo_EVA_new = [matrix_zero_front EbNo_EVA];
EbNo_EVA_new_new = [EbNo_EVA_new EbNo_EVA_ones];
C_mean_EVA = zeros(1, 20);
C_BOB = zeros(1,20);
C_EVA = zeros(1,20);
Capacity_secrecy = zeros(20,20);
Capacity_secrecy1 = zeros(1,raz);

for ii = 1:length(EbNo_BOB)
    for kk = 1:length(EbNo_EVA)
        for jj = 1:raz
            H1 = abs((randn(1) + 1i*randn(1))/sqrt(2)).^2;
            H2 = abs((randn(1) + 1i*randn(1))/sqrt(2)).^2;
            C_BOB = log2(1+H1*EbNo_BOB(ii));
            C_EVA = log2(1+H2*EbNo_EVA(kk));
            Capacity_secrecy1(jj) = max(C_BOB - C_EVA,0);
        end   
        Capacity_secrecy(ii,kk) = mean(Capacity_secrecy1);
    end
    %C_mean_BOB(ii) = mean(C_BOB);
    %C_mean_EVA(ii) = mean(C_EVA);

    
end
[X, Y] = meshgrid(EbNo_BOB, EbNo_EVA);
contourf(X,Y,Capacity_secrecy)
title('Capacity Secrecy')
xlabel('SNR BOB')
ylabel('SNR EVA')

% title('Capacity Alica-Bob')
% xlabel('SNR')
% ylabel('Capacity')
% 
% figure
% plot(1:20,C_mean_EVA(1:end),'-*')
% %xlim([5 15])
% title('Capacity Alica-Eva')
% xlabel('SNR')
% ylabel('Capacity')
% 
% figure
% plot(1:20,Capacity_secrecy(;1:end),'-*')
% title('Capacity secrecy')
% xlabel('SNR')
% ylabel('Capacity secrecy')