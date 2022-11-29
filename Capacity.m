clear all; close all; clc
N = 1e3;
raz = 1e3
EbNo = 1:20;
for ii = 1:length(EbNo):
    for jj = 1:raz
        H = abs(mean((randn(1,N) + 1i*randn(1,N))/sqrt(2))).^2;
        asd = mean(randn(log2(1+H*EbNo),10000));
        C(ii) = 
    end
end
plot(EbNo(1:end),C(1:end),'-o')



