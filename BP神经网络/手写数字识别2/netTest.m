% nnceshi   ����������ⲿ��
clear
clc

load featureextract;
load bpnntrain net;
% P_test = P(:,40:56);
% T_test = T(:,40:56);
% % P_test = premnmx(P_test);
% % T_test = premnmx(T_test);
% Y = sim(net,P_test);
% D = round(Y);%��Yȡ��
% for i=1:16
%     Num(i) = 8*D(1,i)+4*D(2,i)+2*D(3,i)+D(4,i);
% end
% ��ѵ�����������в��ԣ�net��ѵ������˵����磬P_test����������������������Y������������
% E = T_test-Y;
% perf=mse(E)
% ����������
 I = imread('111.bmp');
 ptest = featureExtraction(I);
%ptest = readPicfeature('digit7.mat',4678);
% ����������ȡ������ȡ��������
 ptest = ptest';
%[m1,ps] = mapminmax(ptest)
% ptest = premnmx(ptest)
 Y = sim(net,ptest);
% Y = abs(Y);
%out = 0.5*(max(ptest)-min(ptest))*(Y+1)+min(ptest);
 D = round(Y);%��Yȡ��
 Num = 8*D(1,1)+4*D(2,1)+2*D(3,1)+D(4,1);
% ttest = ttest(:,Num+1)
% E = ttest-abs(Y);
% perf=mse(E)
NO = sprintf('ͼƬ�е�����Ϊ ��%d\n�������Ϊ : %d\n',Num);
msgbox(NO,'����ͼƬʶ����')






