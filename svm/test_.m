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
imshow(A); %AΪ����3�ľ�����ʽ
%imwrite(A,'digit3.png');
[coef,score,latent,t2] = princomp(A);%����PCA�㷨ʵ��������ȡ
score;%score��ʾԭʼ��nά���ݰ��������ɴ�С����
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
