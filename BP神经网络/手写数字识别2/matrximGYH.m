m=[0.11 0.15 0.32 0.45 30;
   0.13 0.24 0.27 0.25 45];
%p=(m-min(m))/(max(m)-min(m));
%[pn,minp,maxp] = premnmx(m);
[m1,ps] = mapminmax(m)%��һ��
m2=mapminmax('reverse',m1,ps)%����һ��
m3=mapminmax('reverse',m1,ps)