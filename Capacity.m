clear all; close all; clc
N = 1e3;
raz = 1e3;
EbNo_BOB = 1:20;
C_mean_BOB = zeros(1, 20);

EbNo_EVA = 5:15;
C_mean_EVA = zeros(1, 11);

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



for ii = 1:11
    for jj = 1:raz
        H = abs((randn(1) + 1i*randn(1))/sqrt(2)).^2;
        C(jj) = log2(1+H*EbNo_EVA(ii));
    end
    C_mean_EVA(ii) = mean(C);
end

figure
plot(EbNo_EVA(1:end),C_mean_EVA(1:end),'-x')

title('Capacity Alica-Eva')
xlabel('SNR')
ylabel('Capacity')
plot(EbNo_EVA(1:end),C_mean_EVA(1:end),'-x')


