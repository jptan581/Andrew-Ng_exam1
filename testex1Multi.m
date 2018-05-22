%�����������
data = load('ex1data2.txt');
x = data(:,1:2);
y = data(:,3);
%������׼��

[x mu sigma] = featureNormalize(x);

%���ۺ���
m = length(y);
x = [ones(m, 1),x];
theta = zeros(3,1);
J = costfunction(x,y,theta); %���ۺ�����Ŀ����Ϊ����J
fprintf('With theta = [0;0;0],Cost computed = %f\n', J);
J = costfunction(x,y,[-1;-1;2]); 
fprintf('With theta = [-1;-1;2],Cost computed = %f\n', J);
%�ݶ��㷨
alpha = 0.01;
num_iters = 4000;
%theta = zeros(3, 1);
[theta, J_history] = gradientDMulti(x, y, theta, alpha, num_iters);
%��ͼ
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);  % numel(A),��������A��Ԫ�ظ���
xlabel('Number of iterations');
ylabel('Cost J');


