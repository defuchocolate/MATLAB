fp = fopen('train_each.txt','w');
[plValue,plIndex] = sort(TrainError);
for TT=1:300
    for  test = 1:ALLNUM
        hfx = zeros(1,CLASSNUM);
        for t=1:TT
           hfx = hfx + HHH(plIndex(t),:,test);            
        end
%           hfx = HHH(plIndex(TT),:,test);
         [yValue,yClass] = max(hfx);
         yResult(1,test) = yClass;
    end
     %*******计算识别率***************
     nRightCount = 0;  
     for i = 1:ALLNUM
        if test_label(i) == yResult(1,i)
            nRightCount = nRightCount + 1;
        end
    end 
    CLASSRATE(CLASSNUM,DIMNUM) = nRightCount/ALLNUM;
    fprintf(1,'TT=%d,DIM= %d,RightCount=%d,RightRatio=%d,train_error=%d\n',TT,DIMNUM,nRightCount,CLASSRATE(CLASSNUM,DIMNUM),plValue(TT));
    fprintf(fp,'TT=%d,DIM= %d,RightCount=%d,RightRatio=%d,train_error=%d\n',TT,DIMNUM,nRightCount,CLASSRATE(CLASSNUM,DIMNUM),plValue(TT));
end
fclose(fp);
