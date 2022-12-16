clear all; close all; clc
N = 1e3;
raz = 1e3;
EbNo = 1:20;
C_mean = zeros(1, 20);
for ii = 1:20
    for jj = 1:raz
        H = abs((randn(1) + 1i*randn(1))/sqrt(2)).^2;
        C(jj) = log2(1+H*EbNo(ii));
    end
    C_mean(ii) = mean(C);
end
plot(EbNo(1:end),C_mean(1:end),'-o')



