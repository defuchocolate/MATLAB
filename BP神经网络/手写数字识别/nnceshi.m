% nnceshi   ����������ⲿ��
clear
clc

load featureextract;
load bpnntrain net;
P_test = P(:,40:56);
T_test = T(:,40:56);

Y = sim(net,P_test);
% ��ѵ�����������в��ԣ�net��ѵ������˵����磬P_test����������������������Y������������
E = T_test-Y;
perf=mse(E)
% ����������

I = imread('test3.bmp');
% ��������ϵ�����ͼƬ���������
ptest = inputvar(I);
% ����������ȡ������ȡ��������
ptest = ptest';
Y = sim(net,ptest);
D = round(Y);%��Yȡ��
Num = 8*D(1,1)+4*D(2,1)+2*D(3,1)+D(4,1);
ttest = ttest(:,Num+1)
E = ttest-abs(Y);
perf=mse(E)
NO = sprintf('ͼƬ�е�����Ϊ ��%d\n�������Ϊ : %d\n',Num,perf);
msgbox(NO,'����ͼƬʶ����')






