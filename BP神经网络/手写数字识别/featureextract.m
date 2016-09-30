% featureextract  数字特征提取部分
clear;
clc;

I = imread('0.bmp');
% 读入数字图片，为个人用画图板制作的图片
p(1,:)=inputvar(I);
% inputvar(x)函数为特征提取函数,对第一个0样本的图片进行特征提取

I = imread('00.bmp');
p(2,:)=inputvar(I);
% 读入第二个关于字符0的样本

I = imread('000.bmp');
p(3,:)=inputvar(I);

I = imread('0000.bmp');
p(4,:)=inputvar(I);

I = imread('1.bmp');
p(5,:)=inputvar(I);

I = imread('11.bmp');
p(6,:)=inputvar(I);

I = imread('111.bmp');
p(7,:)=inputvar(I);

I = imread('1111.bmp');
p(8,:)=inputvar(I);

I = imread('2.bmp');
p(9,:)=inputvar(I);

I = imread('22.bmp');
p(10,:)=inputvar(I);

I = imread('222.bmp');
p(11,:)=inputvar(I);

I = imread('2222.bmp');
p(12,:)=inputvar(I);

I = imread('3.bmp');
p(13,:)=inputvar(I);

I = imread('33.bmp');
p(14,:)=inputvar(I);

I = imread('333.bmp');
p(15,:)=inputvar(I);

I = imread('3333.bmp');
p(16,:)=inputvar(I);

I = imread('4.bmp');
p(17,:)=inputvar(I);

I = imread('44.bmp');
p(18,:)=inputvar(I);

I = imread('444.bmp');
p(19,:)=inputvar(I);

I = imread('4444.bmp');
p(20,:)=inputvar(I);

I = imread('5.bmp');
p(21,:)=inputvar(I);

I = imread('55.bmp');
p(22,:)=inputvar(I);

I = imread('555.bmp');
p(23,:)=inputvar(I);

I = imread('5555.bmp');
p(24,:)=inputvar(I);

I = imread('6.bmp');
p(25,:)=inputvar(I);

I = imread('66.bmp');
p(26,:)=inputvar(I);

I = imread('666.bmp');
p(27,:)=inputvar(I);

I = imread('6666.bmp');
p(28,:)=inputvar(I);

I = imread('7.bmp');
p(29,:)=inputvar(I);

I = imread('77.bmp');
p(30,:)=inputvar(I);

I = imread('777.bmp');
p(31,:)=inputvar(I);

I = imread('7777.bmp');
p(32,:)=inputvar(I);

I = imread('8.bmp');
p(33,:)=inputvar(I);

I = imread('88.bmp');
p(34,:)=inputvar(I);

I = imread('888.bmp');
p(35,:)=inputvar(I);

I = imread('8888.bmp');
p(36,:)=inputvar(I);

I = imread('9.bmp');
p(37,:)=inputvar(I);

I = imread('99.bmp');
p(38,:)=inputvar(I);

I = imread('999.bmp');
p(39,:)=inputvar(I);

I = imread('9999.bmp');
p(40,:)=inputvar(I);

I = imread('test0.bmp');
p(41,:)=inputvar(I);

I = imread('test00.bmp');
p(42,:)=inputvar(I);

I = imread('test1.bmp');
p(43,:)=inputvar(I);

I = imread('test11.bmp');
p(44,:)=inputvar(I);

I = imread('test2.bmp');
p(45,:)=inputvar(I);

I = imread('test22.bmp');
p(46,:)=inputvar(I);

I = imread('test3.bmp');
p(47,:)=inputvar(I);

I = imread('test33.bmp');
p(48,:)=inputvar(I);

I = imread('test4.bmp');
p(49,:)=inputvar(I);

I = imread('test44.bmp');
p(50,:)=inputvar(I);

I = imread('test5.bmp');
p(51,:)=inputvar(I);

I = imread('test55.bmp');
p(52,:)=inputvar(I);

I = imread('test6.bmp');
p(53,:)=inputvar(I);

I = imread('test7.bmp');
p(54,:)=inputvar(I);

I = imread('test8.bmp');
p(55,:)=inputvar(I);

I = imread('test9.bmp');
p(56,:)=inputvar(I);

P = p;
% 输入的训练与测试样本集
T = [0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 1;
    0 0 0 1;
    0 0 0 1;
    0 0 0 1;
    0 0 1 0;
    0 0 1 0;
    0 0 1 0;
    0 0 1 0;
    0 0 1 1;
    0 0 1 1;
    0 0 1 1;
    0 0 1 1;
    0 1 0 0;
    0 1 0 0;
    0 1 0 0;
    0 1 0 0;
    0 1 0 1;
    0 1 0 1;
    0 1 0 1;
    0 1 0 1;
    0 1 1 0;
    0 1 1 0;
    0 1 1 0;
    0 1 1 0;
    0 1 1 1;
    0 1 1 1;
    0 1 1 1;
    0 1 1 1;
    1 0 0 0;
    1 0 0 0;
    1 0 0 0;
    1 0 0 0;
    1 0 0 1;
    1 0 0 1;
    1 0 0 1;
    1 0 0 1
    0 0 0 0
    0 0 0 0
    0 0 0 1
    0 0 0 1
    0 0 1 0
    0 0 1 0
    0 0 1 1
    0 0 1 1
    0 1 0 0
    0 1 0 0
    0 1 0 1
    0 1 0 1
    0 1 1 0
    0 1 1 1
    1 0 0 0
    1 0 0 1];
% 输出的训练与测试样本
ttest = [0 0 0 0    
    0 0 0 1    
    0 0 1 0    
    0 0 1 1    
    0 1 0 0    
    0 1 0 1
    0 1 1 0
    0 1 1 1
    1 0 0 0
    1 0 0 1];
% 1至9数字的标准输出

P = P';
T = T';
ttest = ttest';
save featureextract P T ttest
% 保存特征提取后的输入输出样本数据,生成mat文件以便训练与测试时对样本数据的调用






