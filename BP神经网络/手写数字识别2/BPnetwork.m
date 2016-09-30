% bpnntrain  ����ѵ������沿��
clear 
clc 

load featureextract; 
% �������������������
P_train = P(:,1:40);
%P_train��ѵ����������
T_train = T(:,1:40);  %ѵ������
%P_test = P(:,40:56);  %Ԥ������ 
P_test = P(:,40:56);
T_test = T(:,40:56);  %��������
% P_train = premnmx(P_train);
% T_train = premnmx(T_train);
% P_test = premnmx(P_test);
% T_test = premnmx(T_test);
echo on
net=newff(minmax(P_train),[9 4],{'tansig','tansig'},'trainlm'); 
%newff:����һ��BP����
%minmax(P_train):������������������Сֵ������
%[9 4]:������Ĳ�ṹ
%{'tansig','tansig','tansig'}:���������ת�ƺ���
%'trainlm':ѵ������
% ���ù����佨��ǰ��BP����,�����������Ĵ��ݺ�����ΪS�͵����к���,ʹ��Levenberg-Marquard�㷨����ѵ��
% ��������9����Ԫ��4����Ԫ���
net = init(net);
% �����ʼ��
[m1,n1]=size(net.IW{1,1});
net.IW{1,1}=0.3*ones(m1,n1);
% ��ʼ����ǰ�����Ȩֵ
[m2,n2]=size(net.LW{2,1});
net.LW{2,1}=0.3*ones(m2,n2);
% ��ʼ������������������Ȩֵ
net.trainParam.show=100; %��ʾ�ļ������
net.trainParam.lr=0.01; %����ѧϰ����
net.trainParam.mc=0.9; %��������
net.trainParam.epochs=1000; %���ѵ������
net.trainParam.goal=0.001;%����Ŀ��ֵ
% ����ѵ������
[net,tr] = train(net,P_train,T_train);
% ��̬������ʽ��������ѵ����net��������Ȩֵ�������磬tr��ѵ��������ÿ��ѵ�������
fig = plotperf(tr)


Y = sim(net,P_test);
% ��ѵ�����������з���
D = round(Y);
for i = 1:16  
    Num(i) = 8*D(1,i)+4*D(2,i)+2*D(3,i)+D(4,i);
end
% E = T_test-Y;
% perf=mse(E)
% ����������
echo off

save bpnntrain net fig


