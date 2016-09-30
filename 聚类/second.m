clear all
clc
vm = 306; %��Ϯ�����ٶ�
vl = 816; %���ص����ٶ�
d = 20000 %�����������Ϯ�����ĳ�ʼ����
alpha  = 65/180*pi;%�����������Ϯ�����ĳ�ʼ�Ƕ�

%t = 10:0.0001:50;%��������ʱ��
%dem = 80000; %Σ�վ���
dem = 37324;
i=1; 
tf=zeros(20,1);       %���ص�������ʱ�� 
det=zeros(20,1);      %��Ϯ��������ʱ�� 
lda=1;  

while lda<=dem   
    t=1:0.00001:150;   
    a1=vm.*(det(i)+7+t);      %��Ϯ�������о���    
    a2=vl*t;                  %���ص������о���     
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