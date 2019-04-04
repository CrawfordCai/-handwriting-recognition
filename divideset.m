function [trainSet,validationSet,testSet,trainSet_d,validationSet_d,testSet_d] = divideset(X,Y)
% DIVIDESET���ڻ���ѵ��������֤���Ͳ��Լ�
total_N = size(X,2);     %���������������
trainSet_N = round(0.7*total_N);   %ѵ����������
validationSet_N = round(0.15*total_N);   %��֤��������
id = randperm(total_N);
trainSet_id = id(:,1:trainSet_N);       %ȡǰtrainSet_N��Ϊѵ�������������
validationSet_id = id(:,(trainSet_N+1):(trainSet_N+validationSet_N));    %ȡ���ŵ�validationSet_N��Ϊ��֤�����������
testSet_id = id(:,(trainSet_N+validationSet_N+1):total_N);    %ȡ���ŵ�validationSet_N��Ϊ���Լ����������
trainSet = X(:,trainSet_id);                   %ȡ��ѵ����
validationSet = X(:,validationSet_id);         %ȡ����֤��
testSet = X(:,testSet_id);                     %ȡ�����Լ�
trainSet_d = Y(:,trainSet_id);
validationSet_d = Y(:,validationSet_id);
testSet_d = Y(:,testSet_id);