function ii = integralImage(I)
%�������ܣ������õ�����Ļ���
%���������I��ʾ�Ҷ�ͼ��
%���������ii��ʾ����Ļ���
[row,col] = size(I);
ii=zeros(row,col);
for i=1:row
for j=1:col
     s=sum(I(1:i,j));
     if(j-1<=0)
       ii(i,j) = s;
     else
       ii(i,j)=s+ii(i,j-1);
     end
     s=0;
end
end