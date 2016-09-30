% nnceshi   网络测试与检测部分
clear
clc

load featureextract;
load bpnntrain net;
P_test = P(:,40:56);
T_test = T(:,40:56);

Y = sim(net,P_test);
% 对训练后的网络进行测试，net：训练完成了的网络，P_test：测试样本的特征向量，Y：神经网络的输出
E = T_test-Y;
perf=mse(E)
% 计算测试误差

I = imread('test3.bmp');
% 读入待辨认的数字图片，检测网络
ptest = inputvar(I);
% 调用特征提取函数提取数据特征
ptest = ptest';
Y = sim(net,ptest);
D = round(Y);%对Y取整
Num = 8*D(1,1)+4*D(2,1)+2*D(3,1)+D(4,1);
ttest = ttest(:,Num+1)
E = ttest-abs(Y);
perf=mse(E)
NO = sprintf('图片中的数字为 ：%d\n均方误差为 : %d\n',Num,perf);
msgbox(NO,'数字图片识别结果')






