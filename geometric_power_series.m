clear
clc
close all

res = 0.001;
x = 0:res:1-res;
sum = zeros(1, length(x));
sum_1 = sum;
sum_10 = sum;
sum_100 = sum;
sum_1k = sum;
sum_10k = sum;
sum_100k = sum;
sum_1m = sum;

% for k = 1:1:1000000
%     sum_1m = sum_1m + x.^k;
% end
% norm 0 with 100k 

for k = 1:1:100000
    sum_100k = sum_100k + x.^k;
end

for k = 1:1:10000
    sum_10k = sum_10k + x.^k;
end

for k = 1:1:1000
    sum_1k = sum_1k + x.^k;
end

for k = 1:1:100
    sum_100 = sum_10 + x.^k;
end

for k = 1:1:10
    sum_10 = sum_10 + x.^k;
end

for k = 1:1:1
    sum_1 = sum_1 + x.^k;
end

