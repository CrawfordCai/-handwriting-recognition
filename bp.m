function bp(input,d)
%MYTRAIN����ѵ��BP�����磬�������input��һ������������,d�Ƕ�Ӧ���������
global w1 w2 lr;        %��Ȩֵ����Ϊȫ�ֱ���
yc_output = w1*input;
yc_output = sigmf(yc_output,[1 0]);      %�������ص�Ԫ�����yc
output = w2*yc_output;
output = sigmf(output,[1 0]);      %���������Ԫ�����y
output_err = (d-output).*output.*(1-output);     %����ÿ�������Ԫ�������
yc_err = (w2.'*output_err).*yc_output.*(1-yc_output);       %����ÿ�����ص�Ԫ�������
w1 = w1+lr*yc_err*(input.');   %����w1Ȩֵ
w2 = w2+lr*output_err*(yc_output.');   %����w2Ȩֵ