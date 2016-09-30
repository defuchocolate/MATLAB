function [A] = readPic_row(filename,i)
%input：filename表示输入的文件名，i为读取出第i行图像数据
%output：A表示将找出的图像数据，存储为矩阵形式
load(filename);
A=zeros(28);
   for j=1:28
      for k=1:28
         A(j,k)=D(i,(j-1)*28+k);
      end
   end
figure;
imshow(A);
end