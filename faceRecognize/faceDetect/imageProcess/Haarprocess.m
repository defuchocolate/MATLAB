function [ii] = Haarprocess(imagename)
%HAARPROCESS Summary of this function goes here
%   Detailed explanation goes here
a=imread(imagename);
a=double(a);
imshow(a);
[m,n]=size(a);
%��ʼ����������
s=zeros(m+1,n+1);
ii=zeros(m+1,n+1);

%���ݹ�ʽ�����������ͼ
for i=2:m+1
    for j=2:n+1
        s(i,j)=s(i,j-1)+a(i-1,j-1);
        ii(i,j)=ii(i-1,j)+s(i,j);
    end
end

%ת��Ϊ�Ҷ�ͼ��
ii
 ii = im2uint8(mat2gray(ii(2:m+1,2:n+1)));
figure;
imshow(ii);

end

