clc;
clear;
load 1.mat;
figure
subplot(2,1,1)
if exist('Qlkmeans.xls','file')==2
    dos('del Qlkmeans.xls');
end
x=data';
[coef,score,latent,tsquare]=princomp(x);
latent = 100*latent/sum(latent);
sum(latent(1:25));
%x2=x(1:200,1:20);
x2=score(:,20);
cluster_labels = kmeans(x2,2);
ncol=size(data,2);
C1=[];
C2=[];
for i=1:ncol                 
    if  mod(i,20)==0             
        Q(ceil(i/20),20)=cluster_labels(i);      
    else
        Q(ceil(i/20),mod(i,20))=cluster_labels(i);      
    end
    if cluster_labels(i)==1            
        C1=[C1;i,1];        
    else
        C2=[C2;i,2];        
    end
end
plot(C1(:,1),C1(:,2),'r.',C2(:,1),C2(:,2),'b.');
set(gca,'YTick',[1 2]);
title('PCA+Kmeams');
%xlswrite('Qlkmeans.xls',Q);
subplot(2,1,2) 
if exist('Q1SSC.xls','file')==2     
    dos('del Q1SSC.xls'); 
end 

%[Q1missrate,Q1Mat,Q1grps]=SSC(data,0,true,20,true,1,2);
%load('2a.mat');
% d=pdist(data');
% w=squareform(d);
% n=tril(w,0);
% s=sum(n);
% D=diag(s);
% L=D-n;
% [Q1,A]=eigs(L,2);
% QW=kmeans(Q1,2);
ncol=size(data,2)  
C11=[];
C21=[];

QW=SpectralClustering(data',2,20);
for i=1:ncol                 
    if  mod(i,20)==0             
        Q(ceil(i/20),20)=QW(i);      
    else
        Q(ceil(i/20),mod(i,20))=QW(i);      
    end
    if QW(i)==1            
        C11=[C11;i,1];        
    else
        C21=[C21;i,2];        
    end
end
plot(C11(:,1),C11(:,2),'r.',C21(:,1),C21(:,2),'b.');
%xlswrite('Q1SSC.xls',Q) 
set(gca,'YTick',[ 1 2]); 
title('SSCÆ×¾ÛÀà');