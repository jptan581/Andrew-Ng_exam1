%读入测试数据
data = load('ex1data2.txt');
x = data(:,1:2);
y = data(:,3);
%特征标准化

[x mu sigma] = featureNormalize(x);

%代价函数
m = length(y);
x = [ones(m, 1),x];
theta = zeros(3,1);
J = costfunction(x,y,theta); %代价函数的目的是为了求J
fprintf('With theta = [0;0;0],Cost computed = %f\n', J);
J = costfunction(x,y,[-1;-1;2]); 
fprintf('With theta = [-1;-1;2],Cost computed = %f\n', J);
%梯度算法
alpha = 0.01;
num_iters = 4000;
%theta = zeros(3, 1);
[theta, J_history] = gradientDMulti(x, y, theta, alpha, num_iters);
%出图
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);  % numel(A),返回数组A的元素个数
xlabel('Number of iterations');
ylabel('Cost J');


