function [F] = harr_like(imageMatrix)
%函数功能：计算图像的harr-like特征模板的特征值
%输入参数：imageMatrix表示将要处理的图像的矩阵形式
%输出参数：该图像的harr-like特征模板的特征向量为1*21000
I=double(imageMatrix); %为了减少误差，将imageMatrix矩阵，转化为double类型。
II=integralImage(I); %II表示图片中每个像素点的积分
II=zeroize(II,1,1);%为了计算图像边缘的harr-like特征模板的特征，因此补一行和一列。变为21*21的图像矩阵
F=TemplateEigenvalueCalculation(II); %计算harr-like特征模板的特征值
end

