% featureextract  数字特征提取部分
clear;
clc;

p(1,:)= readPicfeature('digit0.mat',1);
p(2,:)= readPicfeature('digit0.mat',2);
p(3,:)= readPicfeature('digit0.mat',3);
p(4,:)= readPicfeature('digit0.mat',4);

p(5,:)= readPicfeature('digit1.mat',1);
p(6,:)= readPicfeature('digit1.mat',2);
p(7,:)= readPicfeature('digit1.mat',3);
p(8,:)= readPicfeature('digit1.mat',4);

p(9,:)= readPicfeature('digit2.mat',1);
p(10,:)= readPicfeature('digit2.mat',2);
p(11,:)= readPicfeature('digit2.mat',3);
p(12,:)= readPicfeature('digit2.mat',4);

p(13,:)= readPicfeature('digit3.mat',1);
p(14,:)= readPicfeature('digit3.mat',2);
p(15,:)= readPicfeature('digit3.mat',3);
p(16,:)= readPicfeature('digit3.mat',4);

p(17,:)= readPicfeature('digit4.mat',1);
p(18,:)= readPicfeature('digit4.mat',2);
p(19,:)= readPicfeature('digit4.mat',3);
p(20,:)= readPicfeature('digit4.mat',4);

p(21,:)= readPicfeature('digit5.mat',1);
p(22,:)= readPicfeature('digit5.mat',2);
p(23,:)= readPicfeature('digit5.mat',3);
p(24,:)= readPicfeature('digit5.mat',4);


p(25,:)= readPicfeature('digit6.mat',1);
p(26,:)= readPicfeature('digit6.mat',2);
p(27,:)= readPicfeature('digit6.mat',3);
p(28,:)= readPicfeature('digit6.mat',4);

p(29,:)= readPicfeature('digit7.mat',1);
p(30,:)= readPicfeature('digit7.mat',2);
p(31,:)= readPicfeature('digit7.mat',3);
p(32,:)= readPicfeature('digit7.mat',4);


p(33,:)= readPicfeature('digit8.mat',1);
p(34,:)= readPicfeature('digit8.mat',2);
p(35,:)= readPicfeature('digit8.mat',3);
p(36,:)= readPicfeature('digit8.mat',4);


p(37,:)= readPicfeature('digit9.mat',1);
p(38,:)= readPicfeature('digit9.mat',2);
p(39,:)= readPicfeature('digit9.mat',3);
p(40,:)= readPicfeature('digit9.mat',4);


p(41,:)= readPicfeature('digit0.mat',5);
p(42,:)= readPicfeature('digit0.mat',6);

p(43,:)= readPicfeature('digit1.mat',5);
p(44,:)= readPicfeature('digit1.mat',6);


p(45,:)= readPicfeature('digit2.mat',5);
p(46,:)= readPicfeature('digit2.mat',6);


p(47,:)= readPicfeature('digit3.mat',5);
p(48,:)= readPicfeature('digit3.mat',6);


p(49,:)= readPicfeature('digit4.mat',5);
p(50,:)= readPicfeature('digit4.mat',6);


p(51,:)= readPicfeature('digit5.mat',5);
p(52,:)= readPicfeature('digit5.mat',6);


p(53,:)= readPicfeature('digit6.mat',5);
p(54,:)= readPicfeature('digit7.mat',5);


p(55,:)= readPicfeature('digit8.mat',5);
p(56,:)= readPicfeature('digit9.mat',5);


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
    1 0 0 1
   ];
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






