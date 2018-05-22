function [x_norm, mu, sigma] = featureNormalize(x)
x_norm = x;
mu = zeros(1, size(x, 2));      %size(:,2)为数组列数，此为变量x的个数；
sigma = zeros(1, size(x, 2));
x_min = zeros(1, size(x, 2));
x_max = zeros(1, size(x, 2));

for i=1:size(x,2)
    mu(i) = mean(x(:,i));
    %sigma(i) = std(x(:,i));
    x_min(i) = min(x(:,i));
    x_max(i) = max(x(:,i));
    sigma(i) = max(x(:,i)) - min(x(:,i));
    x_norm(:,i) = (x_norm(:,i)-mu(i))/sigma(i);
end
end









