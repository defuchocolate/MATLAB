function [L] = thresholdTeUsing( model,test_set )
feat=test_set(:,model.dim);
if(strcmp(model.pos_neg,'pos'))
    ind=(feat>model.min_error_thr)+1;
else
    ind=(feat<model.min_error_thr)+1;
end
L=zeros(length(feat),2);

L(ind==1,1)=1;
L(ind==2,2)=1;
end
