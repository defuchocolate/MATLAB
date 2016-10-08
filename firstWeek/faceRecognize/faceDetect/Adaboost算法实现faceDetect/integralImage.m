function ii = integralImage(I)
%函数功能：遍历得到各点的积分
%输入参数：I表示灰度图像
%输出参数：ii表示各点的积分
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