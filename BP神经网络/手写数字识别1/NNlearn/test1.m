
%{
%单个线性神经元的使用
net = newlin([-1 1;-1 1],1);
net.IW{1,1} = [1 2];
net.b{1}=1;
P=[1 2 2 3; 2 1 3 1];
A=sim(net,P);
%}

%{
net = newlin([-1 1],1,[0 1]);
net.IW{1,1} = [1 2];
net.biasConnect=0;
P={2 1 3 4};
A=sim(net,P);
disp(A);
%}

clear;
load imageall imageallmatrix;
 
pic1 = imageallmatrix(:,:,1,1);
%image(pic1);
pic2=preprocess(pic1);
image(pic2);
[feature1,f2,q1]=featureget1(pic2);
disp(feature1);
disp(q1);

%{
[coef,score,latent,t2] = princomp(feature1);
score;
cum_latent=cumsum(latent)/sum(latent);
latent=100*latent/sum(latent);%
[ind,val]=find(cum_latent<=0.95);
A = score(:,1:ind(end));
pareto(latent');
%}







