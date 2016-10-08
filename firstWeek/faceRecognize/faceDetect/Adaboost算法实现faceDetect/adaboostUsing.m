function [ L,classLabels ] = adaboostUsing( adaboost_model,te_func_handle,test_set )
hypothesis_n=length(adaboost_model.weights);
sample_n=size(test_set,1);
class_n=2;
temp_L=zeros(sample_n,class_n,hypothesis_n);

for i=1:hypothesis_n
    [temp_L(:,:,i)]=te_func_handle(adaboost_model.parameters{i},...
                                                    test_set);
    temp_L(:,:,i)=temp_L(:,:,i)*adaboost_model.weights(i);
end
L=sum(temp_L,3);%将所有分类器合并成一个
classLabels = likelihood2class(L);
end