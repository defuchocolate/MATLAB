%Ԥ��������ѵ����
clear;
load imageall imageallmatrix;

k=100;%ȡÿ���ַ���ǰK��ѵ����
v=16;%ά��
p_results=zeros(v,k*10);
t_results=zeros(4,k*10);
i=1;
%����0
load('digit0.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,1)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,0,0,0];
    i=i+1;
end;
%����1
load('digit1.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,2)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,0,0,1];
    i=i+1;
end;
%����2
load('digit2.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,3)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,0,1,0]; 
    i=i+1;
end;
%����3
load('digit3.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,4)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,0,1,1]; 
    i=i+1;
end;
%����4
load('digit4.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,5)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,1,0,0];
    i=i+1;
end;
%����5
load('digit5.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,6)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,1,0,1];
    i=i+1;
end;
%����6
load('digit6.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,7)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,1,1,0];
    i=i+1;
end;
%����7
load('digit7.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,8)));
    p_results(:,i)=Q;
    t_results(:,i)=[0,1,1,1]; 
    i=i+1;
end;
%����8
load('digit8.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,9)));
    p_results(:,i)=Q;
    t_results(:,i)=[1,0,0,0];
    i=i+1;
end;
%����9
load('digit9.mat');
for n=1:k
    [ F,P,Q ]=featureget1(preprocess(imageallmatrix(:,:,n,10)));
    p_results(:,i)=Q;
    t_results(:,i)=[1,0,0,1];
    i=i+1;
end;


save traindata  p_results t_results;



