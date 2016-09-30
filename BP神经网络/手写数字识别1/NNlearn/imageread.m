clear;
%
% 
A = zeros(28);%临时变量保存单个字符图片矩阵
b = zeros(1,784);%临时变量保存单行数据

imageallmatrix = zeros(28,28,5000,10);%原始图像矩阵 0-9 个图像

for circle=1:10 
    name1=strcat('digit',num2str(circle-1));%构造要载入文件名
    name2=strcat(name1,'.mat');
    load(name2);%载入文件digit0-9.mat
    
    for n=1:5000  %读取k 行，最大5900行数据
        for m=1:784 %每行有784个数据为一张图的
            b(m)=D(n,m);%读取第n行的
        end;
        for i=1:28  %写入到28*28的矩阵里去。
            for j=1:28
                A(j,i) = b((i)+(j-1)*28);
                imageallmatrix(j,i,n,circle)=b((i)+(j-1)*28);%imageall
            end;
        end;
    end;
end;

save imageall  imageallmatrix;
