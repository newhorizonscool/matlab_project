clear all; close all; clc
N = 1e3;
Hm = [];
EbNo = 1:20;
for ii = 1:EbNo
    H = mean((randn(1,N) + 1i*randn(1,N))/sqrt(2));
    H = abs(H).^2;
    C(ii) = log2(1+(mean((randn(1,N) + 1i*randn(1,N))/sqrt(2))).^2*EbNo);
end 
plot(EbNo(1:end),C(1:end),'-o')



