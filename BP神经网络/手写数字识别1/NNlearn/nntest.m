clear;
load bpnntrain fig net;
load traindata  p_results t_results;
load imageall imageallmatrix;
load testdata p_test t_test;

%{
Y = sim(net,p_results(:,451:500));
% 对训练后的网络进行仿真
y1=round(Y);
E = t_results(:,451:500)-Y;
Num = [8 4 2 1] * y1;
perf=mse(E);
%}
km=100;
Y = sim(net,p_test(:,1:km));
% 对训练后的网络进行仿真
y1=round(Y);
E = t_test(:,1:km)-Y;
Num = [8 4 2 1] * y1;
t= [8 4 2 1] *t_test;
perf=mse(E);
nn=0;
for i=1:km
    if Num(i)==t(i)
        nn=nn+1;
    end;
end;
disp(nn/km);

%{
%辨认图片测试
A = zeros(28);%临时变量保存单个字符图片矩阵

A(:,:) = imageallmatrix(  :,:, 2,5);
ptest = getfeature(A);
ptest = ptest';
Y = sim(net,ptest);
D = round(Y);%对Y取整
Num = 8*D(1,1)+4*D(2,1)+2*D(3,1)+D(4,1);
ttest = ttest(:,Num+1);

E = ttest-abs(Y);
perf=mse(E)
NO = sprintf('图片中的数字为 ：%d\n均方误差为 : %d\n',Num,perf);
msgbox(NO,'数字图片识别结果')
%}
