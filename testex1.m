% 输入原始测试数据，并绘图
data = load('ex1data1.txt');
x = data(:,1);
y = data(:,2);
plot(x,y,'rx','MarkerSize',10);
xlabel('x');
ylabel('y');
%代价函数
m = length(y);
x = [ones(m,1),data(:,1)];
theta = zeros(2,1);
J = costfunction(x,y,theta); %代价函数的目的是为了求J
fprintf('With theta = [0 ; 0],Cost computed = %f\n', J);
J = costfunction(x,y,[-1;2]); 
fprintf('With theta = [-1 ; 2],Cost computed = %f\n', J);
%梯度下降算法
alpha = 0.001;
iteration = 10000;
theta = gradientD(x,y,theta,alpha,iteration);  %梯度下降算法为了得到最小的J，以得到合适的thata
%根据算出的theta，画出拟合曲线
hold on 
plot(x(:,2),x*theta,'g-');
legend('Training data', 'Linear regression');
hold off
%举例，当人口为35000时，价格为多少。
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
%可视化，当不同的theta时，代价函数的三维图
theta0_value =linspace(-10,10,100);
theta1_value =linspace(-1,4,100);
%计算不同theta下的代价函数值
J_values = zeros(length(theta0_value),length(theta1_value));
for i=1:length(theta0_value)
    for j=1:length(theta1_value)
        t = [theta0_value(i);theta1_value(j)];
        J_values(i,j) =  costfunction(x,y,t); 
    end
end
%制作三维图
%J_values = J_values';
figure
surf(theta0_value,theta1_value,J_values);
xlabel('theta0');
ylabel('theta1');
%制作等值线图
figure
contour(theta0_value,theta1_value,J_values,logspace(-2, 3, 20));
xlabel('theta0');
ylabel('theta1');
hold on
plot(theta(1),theta(2),'r+','MarkerSize', 10, 'LineWidth', 2)


