clear
clc
close all

sum = 0;
for k = 1:1:1000000
    sum = sum + ((-1)^k)*(1/k);
end

sum