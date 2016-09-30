function [ii] = Haarprocess(imagename)
%HAARPROCESS Summary of this function goes here
%   Detailed explanation goes here
a=imread(imagename);
a=double(a);
imshow(a);
[m,n]=size(a);
%初始化迭代矩阵
s=zeros(m+1,n+1);
ii=zeros(m+1,n+1);

%根据公式迭代计算积分图
for i=2:m+1
    for j=2:n+1
        s(i,j)=s(i,j-1)+a(i-1,j-1);
        ii(i,j)=ii(i-1,j)+s(i,j);
    end
end

%转化为灰度图像
ii
 ii = im2uint8(mat2gray(ii(2:m+1,2:n+1)));
figure;
imshow(ii);

end

