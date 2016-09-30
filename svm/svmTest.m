N = 50; 
n=2*N;randn('state',6);
x1 = randn(2,N); y1 = ones(1,N);
x2 = 5+randn(2,N);y2 = -ones(1,N);
figure;plot(x1(1,:),x1(2,:),'bx',x2(1,:),x2(2,:),'k.');
axis([-3 8 -3 8]);
title('C-SVC')
hold on;
X1 = [x1,x2];
Y1 = [y1,y2];   
X=X1';Y=Y1'; 
C=Inf; 
ker='linear';
global p1 p2  
p1=3;
p2=1;
[nsv alpha bias] = svc(X,Y,ker,C)