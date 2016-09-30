MSCR = CLASSRATE(20:58,50,:);
crMean = mean(MSCR,1);
[sortValue,sortIndex] = sort(crMean);