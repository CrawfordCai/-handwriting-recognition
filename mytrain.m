function mytrain(trainSet,trainSet_d,validationSet,validationSet_d)
%MYTRAIN����ѵ��BP������
global w1 w2 epochs goal max_fail sigma validation
fail = 0;     %��ǰʧ�ܴ���
count = 0;      %��ǰ��������
sigma = zeros(1);    %ѵ���������
validation = zeros(1);    %��֤�������
trainSet_N = size(trainSet,2);
validationSet_N = size(validationSet,2);

while count<epochs         %���й涨�����ĵ���

%��ȫ���������б���������Ȩֵ
i=1;
while i<=trainSet_N
     input = trainSet(:,i);
     expect_d = trainSet_d(:,i);
     i=i+1;
     bp(input,expect_d);
end

count=count+1;     %����������1

%����ѵ�����ĵ�ǰ���
hidden = w1*trainSet;
hidden = sigmf(hidden,[1 0]);
o = w2*hidden;
o = sigmf(o,[1 0]);
e = trainSet_d-o;
sum = 0;
for num = 1:trainSet_N
   E = e(:,num);
   sum = sum+E.'*E;
end
sigma(count) = sum/2;

%���й��̿��ӻ�
sprintf('��%d�ε��������Ϊ%f',count,sigma(count))

%�ж��Ƿ��ѴﵽĿ�������ǣ��˳���������
if sigma(count) <= goal 
    sprintf('Goal is reached!')
    break
end

%������֤�����
v_hidden = w1*validationSet;
v_hidden = sigmf(v_hidden,[1 0]);
v_o = w2*v_hidden;
v_o = sigmf(v_o,[1 0]);
v_e = validationSet_d-v_o;
v_sum = 0;
for v_num = 1:validationSet_N
    v_E = v_e(:,v_num);
    v_sum = v_sum+v_E.'*v_E;
end
validation(count) = v_sum/2;

%�ж���֤������Ƿ���������
if count ~= 1
    if validation(count) > validation(count-1)
        fail = fail+1;
    else
        fail = 0;
    end
end

%������֤�������ǰ��Ȩֵ
if fail == 0
    best_w1 = w1;
    best_w2 = w2;
end

%�ж�����Ƿ������������ɴε�����������ֹͣѵ��
if fail >= max_fail
    w1 = best_w1;
    w2 = best_w2;
    sprintf('Validation stop.')
    break
end

end