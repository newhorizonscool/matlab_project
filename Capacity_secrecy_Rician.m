clear all; close all; clc
N = 1e3;
raz = 1e5;
K = 10;
EbNo_BOB = 1:0.5:20;
C_mean_BOB = zeros(1, 20);
matrix_zero_front = zeros(1,4);
EbNo_EVA = 1:0.5:20; % нюанс. 
% EbNo_EVA_ones = zeros(1,1);
% EbNo_EVA_new = [matrix_zero_front EbNo_EVA];
% EbNo_EVA_new_new = [EbNo_EVA_new EbNo_EVA_ones];
C_mean_EVA = zeros(1, 20);
C_BOB = zeros(1,20);
C_EVA = zeros(1,20);
Capacity_secrecy = zeros(length(EbNo_BOB),length(EbNo_EVA));
Capacity_secrecy1 = zeros(1,raz);
for ii = 1:length(EbNo_BOB)
    for kk = 1:length(EbNo_EVA)
        for jj = 1:raz
            % h = sqrt( K(k)/(K(k)+1)) +... 
            % sqrt( 1/(K(k)+1))*(1/sqrt(2))*(randn(1)...
            % + 1j*randn(1); 
            H1 = abs(sqrt( K/(K+1)) + ... 
        sqrt( 1/(K+1))*(1/sqrt(2))*(randn(1))...
         + 1j*randn(1)).^2;
            H2 = abs(sqrt( K/(K+1)) + ... 
        sqrt( 1/(K+1))*(1/sqrt(2))*(randn(1))...
         + 1j*randn(1)).^2;
            C_BOB = log2(1+H1*EbNo_BOB(ii));
            C_EVA = log2(1+H2*EbNo_EVA(kk));
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