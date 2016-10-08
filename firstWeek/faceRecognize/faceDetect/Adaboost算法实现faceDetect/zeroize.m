%3 在矩阵上面补0和左面补0
%rn 补rn行0
%cn 补cn列0
function ii = zeroize(iio,rn,cn)
[row,col]=size(iio);
ii=[zeros(rn,col+cn);[zeros(row,cn),iio]];