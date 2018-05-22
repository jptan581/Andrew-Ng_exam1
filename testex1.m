% ����ԭʼ�������ݣ�����ͼ
data = load('ex1data1.txt');
x = data(:,1);
y = data(:,2);
plot(x,y,'rx','MarkerSize',10);
xlabel('x');
ylabel('y');
%���ۺ���
m = length(y);
x = [ones(m,1),data(:,1)];
theta = zeros(2,1);
J = costfunction(x,y,theta); %���ۺ�����Ŀ����Ϊ����J
fprintf('With theta = [0 ; 0],Cost computed = %f\n', J);
J = costfunction(x,y,[-1;2]); 
fprintf('With theta = [-1 ; 2],Cost computed = %f\n', J);
%�ݶ��½��㷨
alpha = 0.001;
iteration = 10000;
theta = gradientD(x,y,theta,alpha,iteration);  %�ݶ��½��㷨Ϊ�˵õ���С��J���Եõ����ʵ�thata
%���������theta�������������
hold on 
plot(x(:,2),x*theta,'g-');
legend('Training data', 'Linear regression');
hold off
%���������˿�Ϊ35000ʱ���۸�Ϊ���١�
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
%���ӻ�������ͬ��thetaʱ�����ۺ�������άͼ
theta0_value =linspace(-10,10,100);
theta1_value =linspace(-1,4,100);
%���㲻ͬtheta�µĴ��ۺ���ֵ
J_values = zeros(length(theta0_value),length(theta1_value));
for i=1:length(theta0_value)
    for j=1:length(theta1_value)
        t = [theta0_value(i);theta1_value(j)];
        J_values(i,j) =  costfunction(x,y,t); 
    end
end
%������άͼ
%J_values = J_values';
figure
surf(theta0_value,theta1_value,J_values);
xlabel('theta0');
ylabel('theta1');
%������ֵ��ͼ
figure
contour(theta0_value,theta1_value,J_values,logspace(-2, 3, 20));
xlabel('theta0');
ylabel('theta1');
hold on
plot(theta(1),theta(2),'r+','MarkerSize', 10, 'LineWidth', 2)


