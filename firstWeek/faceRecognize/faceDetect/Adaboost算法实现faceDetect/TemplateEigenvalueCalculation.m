function F = TemplateEigenvalueCalculation(ii)
%函数功能：计算矩阵ii的harr-like特征模板的特征值
%输入参数：ii表示要进行处理的矩阵
%输出参数：F表示图像的harr-like特征模板的特征值。是一个1*21000的数据

%-------------------------------harr-like特征模板的选择---------------------------------------%
%选取（2,1）特征模板
minw = 1; %最小宽
minh = 2; %最小高
aw=1; %伸缩倍率,w方向
ah=1; %伸缩倍率,h方向
%_____________________________________________________________________________________________%

F=[];
F1=[];
w=minw;
h=minh;
[row,col]=size(ii);

%minh*ah&minw*aw表示harr-like特征模板，在以ah&aw的伸缩倍率向w&h方向延伸
%row-h&col-w表示遍历计算图像中harr-like特征模板的特征值
while(minh*ah<=row) 
    while(minw*aw<=col)
        for i=1:row-h
           for j=1:col-w
              white = ii(i,j)+ii(i+h/2,j+w)-ii(i+h/2,j)-ii(i,j+w);
              black = ii(i+h/2,j)+ii(i+h,j+w)-ii(i+h,j)-ii(i+h/2,j+w);
              F1((i-1)*(col-w)+j)=white-black;
           end
         end
        F=[F,F1];
        F1=[];
        aw=aw+1;
        w=minw*aw;
   end
   ah=ah+1;
   h=minh*ah;
   w=minw; %复位
   aw=1; %复位
end