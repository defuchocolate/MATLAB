clear;
%
% 
A = zeros(28);%��ʱ�������浥���ַ�ͼƬ����
b = zeros(1,784);%��ʱ�������浥������

imageallmatrix = zeros(28,28,5000,10);%ԭʼͼ����� 0-9 ��ͼ��

for circle=1:10 
    name1=strcat('digit',num2str(circle-1));%����Ҫ�����ļ���
    name2=strcat(name1,'.mat');
    load(name2);%�����ļ�digit0-9.mat
    
    for n=1:5000  %��ȡk �У����5900������
        for m=1:784 %ÿ����784������Ϊһ��ͼ��
            b(m)=D(n,m);%��ȡ��n�е�
        end;
        for i=1:28  %д�뵽28*28�ľ�����ȥ��
            for j=1:28
                A(j,i) = b((i)+(j-1)*28);
                imageallmatrix(j,i,n,circle)=b((i)+(j-1)*28);%imageall
            end;
        end;
    end;
end;

save imageall  imageallmatrix;
