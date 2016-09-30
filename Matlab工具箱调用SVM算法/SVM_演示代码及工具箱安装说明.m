
%% ���������
%��svm��optimiser�ļ�·����ӵ�matlab�У�ͨ��setpath
%��·����Ϊoptimiser�ļ�����
%����mex -v qp.c pr_loqo.c��ѡ��1��
%��qp.mexw32�ļ����Ƶ�SVM�ļ����£���Ϊqp.dll�����ԭSVM�ļ����µ�qp.dll
%����mex -setup��ѡ��1��

%% ************************��ά���Է���************************%%

%************************��������*****************%  
load TrainX.mat
load TrainY.mat
load TestX.mat
load TestY.mat
x1=TrainX(find((TrainY==1)==1),:)';
x2=TrainX(find((TrainY==1)==0),:)';
figure
plot(x1(1,:),x1(2,:),'ro',x2(1,:),x2(2,:),'mo')
xlabel('x1');
ylabel('x2');
%************************���ò��������ú���*****************%  
% �����ں˺���
ker='linear';
% ����C
C=Inf;
%���nsv��alpha��bias
[nsv alpha bias] = svc(TrainX,TrainY,ker,C);
%��������ͼ
figure
svcplot(TrainX,TrainY,ker,alpha,bias);

%************************�������ŷֽ��淽��*****************%  
w=[sum((alpha.*TrainY).*TrainX(:,1)) sum((alpha.*TrainY).*TrainX(:,2))];
 
k=-1*w(1)/w(2);

for i=min(TrainX(:,1)):0.1:max(TrainX(:,1))
    hold on
    plot(i,k*i-bias/w(2),'r.')
end
%*************************���ڲ������ݵķ���*****************%  

%���Ԥ��ֵ
predicted=svcoutput(TrainX,TrainY,TestX,ker,alpha,bias);
%testY=predicted;
%ͳ�Ʋ�������������������
err=svcerror(TrainX,TrainY,TestX,TestY,ker,alpha,bias);
%��ͼ�л���Ԥ���
for i=1:length(TestY)
    hold on
    if TestY(i)>0
    plot(TestX(i,1),TestX(i,2),'^','Markerface','g','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    else
    plot(TestX(i,1),TestX(i,2),'^','Markerface','y','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    end
end
disp('��������������');
err

%% ************************��ά�����Է���************************%%


%************************��������*****************%  
clear
clc
load TrainX1.mat
load TrainY1.mat
load TestX1.mat
load TestY1.mat
x1=TrainX(find((TrainY==1)==1),:)';
x2=TrainX(find((TrainY==1)==0),:)';
figure
plot(x1(1,:),x1(2,:),'ro',x2(1,:),x2(2,:),'mo')

%************************���ò��������ú���*****************%   
% �����ں˺���
ker='poly';
global p1
p1=2
% ����C
C=Inf;
%���nsv��alpha��bias
[nsv alpha bias] = svc(TrainX,TrainY,ker,C);
%��������ͼ
svcplot(TrainX,TrainY,ker,alpha,bias);

%*************************���ڲ������ݵķ���*****************%  

%���Ԥ��ֵ
predicted=svcoutput(TrainX,TrainY,TestX,ker,alpha,bias);
%testY=predicted;
%ͳ�Ʋ�������������������
err=svcerror(TrainX,TrainY,TestX,TestY,ker,alpha,bias);
%��ͼ�л���Ԥ���
for i=1:length(TestY)
    hold on
    if TestY(i)>0
    plot(TestX(i,1),TestX(i,2),'^','Markerface','g','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    else
    plot(TestX(i,1),TestX(i,2),'^','Markerface','y','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    end
end
disp('��������������');
err



%% ��ά���Է���

%************************��������*****************%  
clear
clc
load TrainX2.mat
load TrainY2.mat
load TestX2.mat
load TestY2.mat
x1=TrainX(find((TrainY==1)==1),:)';
x2=TrainX(find((TrainY==1)==0),:)';
figure
plot3(x1(1,:),x1(2,:),x1(3,:),'ro',x2(1,:),x2(2,:),x2(3,:),'mo')
grid
%************************���ò��������ú���*****************%  
% �����ں˺���
ker='linear';
% ����C
C=Inf;
%���nsv��alpha��bias
[nsv alpha bias] = svc(TrainX,TrainY,ker,C);

%*************************�������ŷֽ��淽��*****************%  
w=[sum((alpha.*TrainY).*TrainX(:,1)) sum((alpha.*TrainY).*TrainX(:,2)) sum((alpha.*TrainY).*TrainX(:,3))];
hold on
x=min(TrainX(:,1)):0.5:max(TrainX(:,1));
y=min(TrainX(:,1)):0.5:max(TrainX(:,1));
[x y]=meshgrid(x,y);
z=-1*(w(1)*x+w(2)*y+bias)/w(3);
surf(x,y,z)
colormap([1  1  1])
grid
xlabel('x1')
ylabel('x2')
zlabel('x3')
%*************************���ڲ������ݵķ���*****************%  

%���Ԥ��ֵ
predicted=svcoutput(TrainX,TrainY,TestX,ker,alpha,bias);
%testY=predicted;
%ͳ�Ʋ�������������������
err=svcerror(TrainX,TrainY,TestX,TestY,ker,alpha,bias);
%��ͼ�л���Ԥ���
for i=1:length(TestY)
    hold on
    if TestY(i)>0
    plot3(TestX(i,1),TestX(i,2),TestX(i,3),'^','Markerface','g','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    else
    plot3(TestX(i,1),TestX(i,2),TestX(i,3),'^','Markerface','y','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    end
end
grid


