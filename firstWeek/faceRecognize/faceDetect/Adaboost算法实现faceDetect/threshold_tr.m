function model=threshold_tr(train_set,sample_weights,labels)
%函数功能：训练分类的最优阈值（在多个属性中选择一个属性为model.dim作为分类标准，然后再利用该属性为model.dim，选取合适的阈值）
%输入参数：
%          1.train_set&labels表示训练集与训练集标签
%          2.sample_weights表示样本权重
%输出参数：model为结构体，里面保存最小误差，最优阈值和维数

model=struct('min_error',[],'min_error_thr',[],'pos_neg',[],'dim',[]);
sample_n=size(train_set,1);
min_error=sum(sample_weights);
min_error_thr=0;
pos_neg='pos';

% for each dimension
for dim=1:size(train_set,2)
    sorted=sort(train_set(:,dim),1,'ascend');
    % for each interval(间隔) in the specified dimension
    for i=1:(sample_n+1)
        if(i==1)
            thr=sorted(1)-0.5;
        elseif(i==sample_n+1)
            thr=sorted(sample_n)+0.5;
        else
            thr=(sorted(i-1)+sorted(i))/2;
        end
        ind1=train_set(:,dim)<thr;%使用阈值thr进行分类，小于阈值的为一类，大于阈值的为一类
        ind2=~ind1;
        tmp_err=sum(sample_weights((labels.*ind1)==2))+sum(sample_weights((labels.*ind2)==1));%计算使用该阈值thr的分类误差
        if(tmp_err<min_error)
            min_error=tmp_err;
            min_error_thr=thr;
            pos_neg='pos';
            model.dim=dim;
        end
       
        ind1=train_set(:,dim)<thr;
        ind2=~ind1;
        tmp_err=sum(sample_weights((labels.*ind1)==1))+sum(sample_weights((labels.*ind2)==2));
       
        if(tmp_err<min_error)
            min_error=tmp_err;
            min_error_thr=thr;
            pos_neg='neg';
            model.dim=dim;
        end
    end
end
model.min_error=min_error;
model.min_error_thr=min_error_thr;
model.pos_neg=pos_neg;
end
