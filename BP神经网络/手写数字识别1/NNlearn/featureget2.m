function [ F,P ] = featureget2( A )
%特征提取2
%粗网格提取2

[m,n] = size(A);%获取图片的尺寸,m=28,n=28
p = zeros(1,16);%产生一个1*16的零向量
p2 = zeros(4,4);%产生一个向量

for k=1:4
    for i=1+(k-1)*7 : m/4+(k-1)*7 %
        for j=1:n/4  %
            if A(i,j)==255
                p(k) = p(k)+1;%  累加和
            else % ==1
                p(k) = p(k);%不变
            end;
        end;
        
        for j=n/4+1:n/2
            if A(i,j)==255
                p(k+4) = p(k+4)+1;%
            else
                p(k+4) = p(k+4);
            end;
        end;
        
        for j=n/2+1: (n*3)/4
            if A(i,j)==255
                p(k+8) = p(k+8)+1;%
            else
                p(k+8) = p(k+8);
            end;
        end;
        
        for j=(n*3)/4+1:n
            if A(i,j)==255
                p(k+12) = p(k+12)+1;%
            else
                p(k+12) = p(k+12);
            end;
        end;
        
    end;
end;
P=p;
p2(1,1)=p(1);
p2(1,2)=p(2);
p2(1,3)=p(3);
p2(1,4)=p(4);

p2(2,1)=p(5);
p2(2,2)=p(6);
p2(2,3)=p(7);
p2(2,4)=p(8);

p2(3,1)=p(9);
p2(3,2)=p(10);
p2(3,3)=p(11);
p2(3,4)=p(12);

p2(4,1)=p(13);
p2(4,2)=p(14);
p2(4,3)=p(15);
p2(4,4)=p(16);

F=p2';
