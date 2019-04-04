%% ��ջ�������
clc
clear

%% �������ݼ��������

load('data.mat');
global w1 w2 lr epochs goal max_fail sigma validation;
m =25;    %���ز㵥Ԫ��
w1 = rand(m,784)*0.2-0.1;           %����㵽���ز��Ȩֵ,��Χ��(-0.1,0.1)
w2 = rand(10,m)*0.2-0.1;            %���ز㵽������Ȩֵ,��Χ��(-0.1,0.1)
lr =0.02;    %ѧϰ����
epochs = 300;    %����������
goal = 0;     %�������
max_fail = 6;   %���ʧ�ܴ���

%% ѵ������

%�������ݼ�
[trainSet,validationSet,testSet,trainSet_d,validationSet_d,testSet_d]=divideset(x,d);

%ѵ������
mytrain(trainSet,trainSet_d,validationSet,validationSet_d);

%% ������

yc = w1*testSet;
yc = sigmf(yc,[1 0]);      %�������ص�Ԫ�����yc
y = w2*yc;
y = sigmf(y,[1 0]);      %���������Ԫ�����y
figure(1)
plotconfusion(testSet_d,y);          %������������
figure(2)
plot(sigma,'.');     %����ѵ�����̵����仯ͼ
hold on
plot(validation,'r+');               %������֤�������仯ͼ
legend('Training set error','Validation set error');     %����ͼ��
