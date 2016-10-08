function [L,hits,error_rate]=threshold_te(model,test_set,sample_weights,true_labels)
%�������ܣ��������������ķ�����ֵ
%���������
%         1.test_set,sample_weights,true_labels��ʾѵ��������Լ���Ȩ�غͱ�ǩ
%         2.model��ʾ���������Ĳ���
%���������
%         1.hits����ʾ������ȷ�ĸ���
%         2.error_rate����ʾ����Ĵ�����
%         3.L����ʾ�γɵķ������� 
feat=test_set(:,model.dim);%��ȡ������������ѡȡ������model.dim��Ϊ�����׼[feat�����ʵ�]
if(strcmp(model.pos_neg,'pos'))%�ж��Ƿ����ã�������ֵ�ķ�Ϊ�ڶ��ࡣ
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

