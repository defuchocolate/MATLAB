function y = featureExtraction(origin_data)
%FEATUREEXTRACTION Summary of this function goes here
%   Detailed explanation goes here
%origin_data_=~origin_data;
% [coef,score,latent,t2] = princomp(origin_data);
% cum_latent=cumsum(latent)/sum(latent);
% %[ind,val]=find(cum_latent<=0.95)
% %A = score(:,1:ind(end));
% B=score(:,1:5);
%  k=1;
%     for i=1:28
%        for j=1:5
%           data(k)=B((i-1)+j);
%           %data(n,k)=[data(n,k)];
%           k=k+1;
%        end
%     end
% A=data;
% end
thresh = graythresh(origin_data);     %�Զ�ȷ����ֵ����ֵ
origin_data = im2bw(origin_data,thresh);       %��ͼ���ֵ��
origin_data = ~origin_data;
[m,n] = size(origin_data);%��ȡͼƬ�ĳߴ�,m=16,n=8
p = zeros(1,17);%����һ��1*17��������
for k=1:4
    for i=1+(k-1)*4:m/4+(k-1)*4
        for j=1:n/2
            if origin_data(i,j)==0
                p(k) = p(k)+1;
            else
                p(k) = p(k);
            end
        end
        for j=n/2+1:n
            if origin_data(i,j)==0
                p(k+4) = p(k+4)+1;
            else
                p(k+4) = p(k+4);
            end
        end
    end
end
 % ��ͼƬ�ֳɰ˸��������������Ե�ͼ���ܶ�,��Ϊ������������
p(9) = p(1)+p(2);
p(10) = p(3)+p(4);
p(11) = p(5)+p(6);
p(12) = p(7)+p(8);
p(13) = p(1)+p(5);
p(14) = p(2)+p(6);
p(15) = p(3)+p(7);
p(16) = p(4)+p(8);
p(17) = p(9)+p(10)+p(11)+p(12);
y = p/784;
 % �ϲ������ͼ���ܶ���Ϊ����������������

