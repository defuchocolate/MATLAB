function C = SpectralClustering(data,k,a)     
%data是数据点矩阵  K是聚类个数  a代表高斯核函数的参数
    d = pdist(data);
    d2 = squareform(d);
    d3 = d2.^2;
    W(:,:) = exp(-d3(:,:)/(2*a^2));%构造相似矩阵
    size(W)
    [n,m] = size(W);  
    s = sum(W);
    sparse(1:n,1:n,s);
    D = full(sparse(1:n,1:n,s));
    size(D)
    E = D^(-1/2)*W*D^(-1/2);
    [X,B] = eig(E);
    [Q,V] = eigs(E,k);%选的是前K个最大特征值对应的特征向量
    C = kmeans(Q,k);
end

