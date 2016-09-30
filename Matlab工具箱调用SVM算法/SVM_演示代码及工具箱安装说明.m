
%% 工具箱添加
%将svm、optimiser文件路径添加到matlab中，通过setpath
%将路径改为optimiser文件夹下
%运行mex -v qp.c pr_loqo.c，选择【1】
%将qp.mexw32文件复制到SVM文件夹下，改为qp.dll，替代原SVM文件夹下的qp.dll
%运行mex -setup，选择【1】

%% ************************二维线性分类************************%%

%************************导入数据*****************%  
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
%************************设置参数，调用函数*****************%  
% 设置内核函数
ker='linear';
% 设置C
C=Inf;
%求解nsv、alpha、bias
[nsv alpha bias] = svc(TrainX,TrainY,ker,C);
%画出分类图
figure
svcplot(TrainX,TrainY,ker,alpha,bias);

%************************画出最优分界面方程*****************%  
w=[sum((alpha.*TrainY).*TrainX(:,1)) sum((alpha.*TrainY).*TrainX(:,2))];
 
k=-1*w(1)/w(2);

for i=min(TrainX(:,1)):0.1:max(TrainX(:,1))
    hold on
    plot(i,k*i-bias/w(2),'r.')
end
%*************************对于测试数据的分类*****************%  

%输出预测值
predicted=svcoutput(TrainX,TrainY,TestX,ker,alpha,bias);
%testY=predicted;
%统计测试样本分类错误的数量
err=svcerror(TrainX,TrainY,TestX,TestY,ker,alpha,bias);
%在图中画出预测点
for i=1:length(TestY)
    hold on
    if TestY(i)>0
    plot(TestX(i,1),TestX(i,2),'^','Markerface','g','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    else
    plot(TestX(i,1),TestX(i,2),'^','Markerface','y','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    end
end
disp('错误分类的数量：');
err

%% ************************二维非线性分类************************%%


%************************导入数据*****************%  
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

%************************设置参数，调用函数*****************%   
% 设置内核函数
ker='poly';
global p1
p1=2
% 设置C
C=Inf;
%求解nsv、alpha、bias
[nsv alpha bias] = svc(TrainX,TrainY,ker,C);
%画出分类图
svcplot(TrainX,TrainY,ker,alpha,bias);

%*************************对于测试数据的分类*****************%  

%输出预测值
predicted=svcoutput(TrainX,TrainY,TestX,ker,alpha,bias);
%testY=predicted;
%统计测试样本分类错误的数量
err=svcerror(TrainX,TrainY,TestX,TestY,ker,alpha,bias);
%在图中画出预测点
for i=1:length(TestY)
    hold on
    if TestY(i)>0
    plot(TestX(i,1),TestX(i,2),'^','Markerface','g','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    else
    plot(TestX(i,1),TestX(i,2),'^','Markerface','y','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    end
end
disp('错误分类的数量：');
err



%% 三维线性分类

%************************导入数据*****************%  
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
%************************设置参数，调用函数*****************%  
% 设置内核函数
ker='linear';
% 设置C
C=Inf;
%求解nsv、alpha、bias
[nsv alpha bias] = svc(TrainX,TrainY,ker,C);

%*************************画出最优分界面方程*****************%  
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
%*************************对于测试数据的分类*****************%  

%输出预测值
predicted=svcoutput(TrainX,TrainY,TestX,ker,alpha,bias);
%testY=predicted;
%统计测试样本分类错误的数量
err=svcerror(TrainX,TrainY,TestX,TestY,ker,alpha,bias);
%在图中画出预测点
for i=1:length(TestY)
    hold on
    if TestY(i)>0
    plot3(TestX(i,1),TestX(i,2),TestX(i,3),'^','Markerface','g','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    else
    plot3(TestX(i,1),TestX(i,2),TestX(i,3),'^','Markerface','y','MarkerEdgeColor',[.7 .9 .7],'Markersize',8)
    end
end
grid


