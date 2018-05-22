function [theta, J_history] = gradientDMulti(x, y, theta, alpha, num_iters);

J_history = zeros(num_iters,1);
m = length(y);

for iter=1:num_iters
theta = theta - alpha/m * x'*(x*theta-y);
J_history(iter) = costfunction(x,y,theta);
end
end