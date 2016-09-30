%预处理生成测试集
clear;
load imageall imageallmatrix;

k=1201;%取每个字符集K-r做测试集
r=1250;
v=16;%维度
p_test=zeros(v,(k-r+1)*10);
t_test=zeros(4,(k-r+1)*10);
i=1;
%数字0
load('digit0.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,1)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,0,0,0];
    i=i+1;
end;
%数字1
load('digit1.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,2)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,0,0,1];
    i=i+1;
end;
%数字2
load('digit2.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,3)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,0,1,0]; 
    i=i+1;
end;
%数字3
load('digit3.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,4)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,0,1,1]; 
    i=i+1;
end;
%数字4
load('digit4.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,5)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,1,0,0];
    i=i+1;
end;
%数字5
load('digit5.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,6)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,1,0,1];
    i=i+1;
end;
%数字6
load('digit6.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,7)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,1,1,0];
    i=i+1;
end;
%数字7
load('digit7.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,8)));
    p_test(:,i)=Q;
    t_test(:,i)=[0,1,1,1]; 
    i=i+1;
end;
%数字8
load('digit8.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,9)));
    p_test(:,i)=Q;
    t_test(:,i)=[1,0,0,0];
    i=i+1;
end;
%数字9
load('digit9.mat');
for n=k:r
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,10)));
    p_test(:,i)=Q;
    t_test(:,i)=[1,0,0,1];
    i=i+1;
end;


save testdata  p_test t_test;