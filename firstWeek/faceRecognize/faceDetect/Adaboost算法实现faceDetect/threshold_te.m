function [L,hits,error_rate]=threshold_te(model,test_set,sample_weights,true_labels)
%函数功能：测试弱分类器的分类阈值
%输入参数：
%         1.test_set,sample_weights,true_labels表示训练集或测试集的权重和标签
%         2.model表示弱分类器的参数
%输出参数：
%         1.hits：表示分类正确的个数
%         2.error_rate：表示分类的错误率
%         3.L：表示形成的分类器。 
feat=test_set(:,model.dim);%提取在弱分类器中选取的属性model.dim作为分类标准[feat：合适的]
if(strcmp(model.pos_neg,'pos'))%判断是否利用，大于阈值的分为第二类。
    ind=(feat>model.min_error_thr)+1;
else
    ind=(feat<model.min_error_thr)+1;
end
hits=sum(ind==true_labels);
error_rate=sum(sample_weights(ind~=true_labels));

L=zeros(length(feat),2);

L(ind==1,1)=1;
L(ind==2,2)=1;

end

