% nnceshi   网络测试与检测部分
clear
clc

load featureextract;
load bpnntrain net;
% P_test = P(:,40:56);
% T_test = T(:,40:56);
% % P_test = premnmx(P_test);
% % T_test = premnmx(T_test);
% Y = sim(net,P_test);
% D = round(Y);%对Y取整
% for i=1:16
%     Num(i) = 8*D(1,i)+4*D(2,i)+2*D(3,i)+D(4,i);
% end
% 对训练后的网络进行测试，net：训练完成了的网络，P_test：测试样本的特征向量，Y：神经网络的输出
% E = T_test-Y;
% perf=mse(E)
% 计算测试误差
 I = imread('111.bmp');
 ptest = featureExtraction(I);
%ptest = readPicfeature('digit7.mat',4678);
% 调用特征提取函数提取数据特征
 ptest = ptest';
%[m1,ps] = mapminmax(ptest)
% ptest = premnmx(ptest)
 Y = sim(net,ptest);
% Y = abs(Y);
%out = 0.5*(max(ptest)-min(ptest))*(Y+1)+min(ptest);
 D = round(Y);%对Y取整
 Num = 8*D(1,1)+4*D(2,1)+2*D(3,1)+D(4,1);
% ttest = ttest(:,Num+1)
% E = ttest-abs(Y);
% perf=mse(E)
NO = sprintf('图片中的数字为 ：%d\n均方误差为 : %d\n',Num);
msgbox(NO,'数字图片识别结果')






