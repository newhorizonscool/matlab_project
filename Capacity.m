clear all; close all; clc
N = 1e3;
raz = 1e3;
EbNo_BOB = 1:20;
C_mean_BOB = zeros(1, 20);

EbNo_EVA = 5:19; % нюанс. 
C_mean_EVA = zeros(1, 20);

for ii = 1:20
    for jj = 1:raz
        H = abs((randn(1) + 1i*randn(1))/sqrt(2)).^2;
        C_BOB(jj) = log2(1+H*EbNo_BOB(ii));
    end
    C_mean_BOB(ii) = mean(C_BOB);
end
figure
plot(EbNo_BOB(1:end),C_mean_BOB(1:end),'-o')

title('Capacity Alica-Bob')
xlabel('SNR')
ylabel('Capacity')



for ii = 5:15 %нюанс
    for jj = 1:raz
        H = abs((randn(1) + 1i*randn(1))/sqrt(2)).^2;
        C(jj) = log2(1+H*EbNo_EVA(ii));
    end
    C_mean_EVA(ii) = mean(C);
end

figure
plot(1:20,C_mean_EVA(1:end),'-*')
xlim([5 15])
title('Capacity Alica-Eva')
xlabel('SNR')
ylabel('Capacity')

Capacity_secrecy = zeros(1,20); %лишняя строчка
Capacity_secrecy = C_mean_BOB;
for qq = 1:20
    Capacity_secrecy(qq) = C_mean_BOB(qq) - C_mean_EVA(qq);
    if C_mean_EVA(qq) > C_mean_BOB(qq)
        Capacity_secrecy(qq) = 0;
    end
end 

figure
plot(1:20,Capacity_secrecy(1:end),'-*')
title('Capacity secrecy')
xlabel('SNR')
ylabel('Capacity secrecy')

