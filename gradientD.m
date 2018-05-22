function theta = gradientD(x,y,theta,alpha,num_iters)

m = length(y);
J_history = zeros(num_iters:1);

for iter=1:num_iters
theta = theta - alpha/m * x'*(x*theta-y);
J_history(iter) = costfunction(x,y,theta);
end
end