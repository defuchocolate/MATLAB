clear;
load traindata  p_results t_results;


net=newff(minmax(p_results),[50 10 4],{'tansig','tansig','tansig'},'trainlm'); 
%newff:建立一个BP网络
%minmax(P_train):对神经网络输入的最大最小值的限制
%[9 4]:神经网络的层结构
%{'tansig','tansig','tansig'}:神经网络各层转移函数
%'trainlm':训练函数
% 利用工具箱建立前向BP网络,输入输出隐层的传递函数均为S型的正切函数,使用Levenberg-Marquard算法进行训练
% 隐层设置9个神经元，4个神经元输出
net = init(net);
% 网络初始化
[m1,n1]=size(net.IW{1,1});
net.IW{1,1}=0.3*ones(m1,n1);
% 初始化当前输入层权值
[m2,n2]=size(net.LW{2,1});
net.LW{2,1}=0.3*ones(m2,n2);
% 初始化隐层与输出层的连接权值
net.trainParam.show=100; %显示的间隔次数
net.trainParam.lr=0.01; %网络学习速率
net.trainParam.mc=0.9; %动量因子
net.trainParam.epochs=1000; %最大训练次数
net.trainParam.goal=0.001;%性能目标值
% 设置训练参数
[net,tr] = train(net,p_results,t_results);
% 静态批处理方式进行网络训练，net：更新了权值的神经网络，tr：训练次数和每次训练的误差
fig = plotperf(tr)

Y = sim(net,p_results);
% 对训练后的网络进行仿真
E = t_results-Y;
perf=mse(E)
% 计算仿真误差

save bpnntrain net fig