function [F] = harr_like(imageMatrix)
%�������ܣ�����ͼ���harr-like����ģ�������ֵ
%���������imageMatrix��ʾ��Ҫ�����ͼ��ľ�����ʽ
%�����������ͼ���harr-like����ģ�����������Ϊ1*21000
I=double(imageMatrix); %Ϊ�˼�������imageMatrix����ת��Ϊdouble���͡�
II=integralImage(I); %II��ʾͼƬ��ÿ�����ص�Ļ���
II=zeroize(II,1,1);%Ϊ�˼���ͼ���Ե��harr-like����ģ�����������˲�һ�к�һ�С���Ϊ21*21��ͼ�����
F=TemplateEigenvalueCalculation(II); %����harr-like����ģ�������ֵ
end

