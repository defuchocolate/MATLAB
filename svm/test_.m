clear all;
clc;
load('digit3.mat');
A=zeros(28);
for j=1:28
      for k=1:28
        %A(j,k)=b((j-1)*28+k);
         A(j,k)=D(1000,(j-1)*28+k);
      end
end
figure;
imshow(A); %A为数字3的矩阵形式
%imwrite(A,'digit3.png');
[coef,score,latent,t2] = princomp(A);%采用PCA算法实现特征提取
score;%score表示原始的n维数据按贡献率由大到小排列
%score_test=bsxfun(@minus,A,mean(A,1))*coef;
%score_test;
latent=100*latent/sum(latent);
figure;
pareto(latent);
figure;
ch=score(:,1:5);
figure;
imshow(ch)
imwrite(ch,'red.png')
