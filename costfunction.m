function J = costfunction(x,y,theta)

J = 0;
m = length(y);
h = x*theta;
J = 1/(2*m)*sum((h-y).^2); 
end
