function [A] = readPic_row(filename,i)
%input��filename��ʾ������ļ�����iΪ��ȡ����i��ͼ������
%output��A��ʾ���ҳ���ͼ�����ݣ��洢Ϊ������ʽ
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