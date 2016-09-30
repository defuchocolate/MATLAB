%*************************************************************************
%  using the prm providing with the distribution DD over the training sample
%
%***************************************************************************
%  
%***************************************************************************
function yClass = prm_distribution(Y,trainY,train_label,DD,CLASSNUM,EACHNUM)
% ResampleCount = zeros(size(trainY,1),1);
% ResampleLabel = zeros(1,1);
ResampleSize = CLASSNUM*(EACHNUM) -1;
for temp = 1:ResampleSize
    nRand = RandWithDistribution(DD,CLASSNUM*EACHNUM);    
    ResampleData(:,temp) = trainY(:,nRand);
    ResampleLabel(:,temp) = train_label(nRand);
end
% for temp = 1:EACHNUM:CLASSNUM*EACHNUM
%      ResampleData(:,tempIndex:tempIndex) = trainY(:,temp); 
%      ResampleLabel(:,tempIndex:tempIndex) = train_label(temp);
%      tempIndex = tempIndex + 1;
%      ResampleData(:,tempIndex:tempIndex) = trainY(:,temp+1); 
%      ResampleLabel(:,tempIndex:tempIndex) = train_label(temp+1);
%      tempIndex = tempIndex + 1;    
% end
yClass = prm(Y,ResampleData,ResampleLabel,CLASSNUM);
