clear all
clc
vm = 306; %来袭导弹速度
vl = 816; %拦截导弹速度
d = 20000 %护卫舰相对来袭导弹的初始距离
alpha  = 65/180*pi;%护卫舰相对来袭导弹的初始角度

%t = 10:0.0001:50;%导弹飞行时间
%dem = 80000; %危险距离
dem = 37324;
i=1; 
tf=zeros(20,1);       %拦截导弹飞行时间 
det=zeros(20,1);      %来袭导弹飞行时间 
lda=1;  

while lda<=dem   
    t=1:0.00001:150;   
    a1=vm.*(det(i)+7+t);      %来袭导弹飞行距离    
    a2=vl*t;                  %拦截导弹飞行距离     
    yux=(d^2+a1.^2-a2.^2)./(2*a1*d);    
    fin=yux-cos(alpha);    
    fin=abs(fin);     
    b=min(fin);     
    x=find(fin==b);     
    tf(i)=t(x);     
    det(i+1)=tf(i)+7+det(i);     
    lda=vm*det(i+1);   
    i=i+1;
end 