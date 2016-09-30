clc;
clear;
load 2b.mat; 
Q2Bgrps=SpectralClustering(data',3,20) 
ncol=size(data,2);
C1=[]; 
C2=[]; 
C3=[]; 
for i=1:ncol     
    if Q2Bgrps(i)==1         
        C1=[C1;data(1,i),data(2,i),data(3,i)];    
    elseif Q2Bgrps(i)==2       
        C2=[C2;data(1,i),data(2,i),data(3,i)];       
    elseif Q2Bgrps(i)==3        
        C3=[C3;data(1,i),data(2,i),data(3,i)];     
    end
end
figure 
scatter3(C1(:,1),C1(:,2),C1(:,3),'r.'); 
hold on;
scatter3(C2(:,1),C2(:,2),C2(:,3),'b.'); 
hold on; 
scatter3(C3(:,1),C3(:,2),C3(:,3),'g.'); 
axis equal 
az=70; 
e1=10; 
view(az,e1);