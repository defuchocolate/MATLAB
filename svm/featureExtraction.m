function [A] = featureExtraction(origin_data)
%origin_data代表需要处理的图像矩阵
%A代表经过PCA算法降维后（即提取特征值后）的图像矩阵
[coef,score,latent,t2] = princomp(origin_data);
cum_latent=cumsum(latent)/sum(latent);
[ind,val]=find(cum_latent<=0.95)
A = score(:,1:ind(end));
end

