%*****************依据分布产生一个随机数***********************
%
%
%**************************************************************
function nSample = RandWithDistribution(DD,N)

    nRand = rand(1);
    nPos = 0;
    nSample = 1;
    for i=1:N
        if nRand >= nPos & nRand < nPos + DD(i)
            nSample = i;
        end
        nPos = nPos + DD(i);
    end
