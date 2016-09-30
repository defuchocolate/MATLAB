function [A] = featureExtraction(origin_data)
%origin_data������Ҫ�����ͼ�����
%A������PCA�㷨��ά�󣨼���ȡ����ֵ�󣩵�ͼ�����
[coef,score,latent,t2] = princomp(origin_data);
cum_latent=cumsum(latent)/sum(latent);
[ind,val]=find(cum_latent<=0.95)
A = score(:,1:ind(end));
end

