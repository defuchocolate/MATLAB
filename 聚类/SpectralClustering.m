function C = SpectralClustering(data,k,a)     
%data�����ݵ����  K�Ǿ������  a�����˹�˺����Ĳ���
    d = pdist(data);
    d2 = squareform(d);
    d3 = d2.^2;
    W(:,:) = exp(-d3(:,:)/(2*a^2));%�������ƾ���
    size(W)
    [n,m] = size(W);  
    s = sum(W);
    sparse(1:n,1:n,s);
    D = full(sparse(1:n,1:n,s));
    size(D)
    E = D^(-1/2)*W*D^(-1/2);
    [X,B] = eig(E);
    [Q,V] = eigs(E,k);%ѡ����ǰK���������ֵ��Ӧ����������
    C = kmeans(Q,k);
end

