%²âÊÔº¯Êý
function [L,hits]=adaboost_te(adaboost_model,te_func_handle,test_set,true_labels)
hypothesis_n=length(adaboost_model.weights);
sample_n=size(test_set,1);
class_n=length(unique(true_labels));
temp_L=zeros(sample_n,class_n,hypothesis_n);

for i=1:hypothesis_n
    [temp_L(:,:,i),hits,error_rate]=te_func_handle(adaboost_model.parameters{i},...
                                                    test_set,ones(sample_n,1),true_labels);
    temp_L(:,:,i)=temp_L(:,:,i)*adaboost_model.weights(i);
end
L=sum(temp_L,3);
hits=sum(likelihood2class(L)==true_labels);
end
