%3 �ھ������油0�����油0
%rn ��rn��0
%cn ��cn��0
function ii = zeroize(iio,rn,cn)
[row,col]=size(iio);
ii=[zeros(rn,col+cn);[zeros(row,cn),iio]];