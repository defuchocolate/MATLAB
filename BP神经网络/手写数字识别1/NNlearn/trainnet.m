clear;
load traindata  p_results t_results;


net=newff(minmax(p_results),[50 10 4],{'tansig','tansig','tansig'},'trainlm'); 
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
[net,tr] = train(net,p_results,t_results);
% ��̬������ʽ��������ѵ����net��������Ȩֵ�������磬tr��ѵ��������ÿ��ѵ�������
fig = plotperf(tr)

Y = sim(net,p_results);
% ��ѵ�����������з���
E = t_results-Y;
perf=mse(E)
% ����������

save bpnntrain net fig