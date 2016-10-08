%这里需要另外分别撰写两个函数，其中一个为生成adaboost模型的训练函数，另外为测试的的测试样本的测试函数.代码如下：
function adaboost_model=adaboost_tr(tr_func_handle,te_func_handle,train_set,labels,no_of_hypothesis) 
%函数功能：通过输入的参数，进行训练分类器
%输入参数：
%          1.tr_func_handle表示threshold_tr函数的句柄。
%          2.te_func_handle表示threshold_te函数的句柄
%          3.train_set&labels表示训练数据和训练数据的标签
%          4.no_of_hypothesis表示弱分类器的个数
%输出参数：adaboost_model表示模型参数，是一个结构体
%          1.adaboost_model.weights表示每个弱分类器的权重
%          2.adaboost_model.parameters{i}表示第i个弱分类器的参数，包括最小误差，最优阈值，维数    
adaboost_model = struct('weights',zeros(1,no_of_hypothesis),...
                        'parameters',[]); %cell(1,no_of_hypothesis));

sample_n = size(train_set,1);
samples_weight = ones(sample_n,1)/sample_n;%初始化样本的权重

for turn=1:no_of_hypothesis
    adaboost_model.parameters{turn} = tr_func_handle(train_set,samples_weight,labels);%训练该弱分类器
    [L,hits,error_rate] = te_func_handle(adaboost_model.parameters{turn},...
                                         train_set,samples_weight,labels);%测试该弱分类器
    if(error_rate==1)
        error_rate=1-eps; %eps为MATLAB默认最小浮点数的精度
    elseif(error_rate==0)
        error_rate=eps;
    end

    % The weight of the turn-th weak classifier
    adaboost_model.weights(turn) = log10((1-error_rate)/error_rate);%计算弱分类器的权重
    C=likelihood2class(L);
    t_labeled=(C==labels);    % true labeled samples

    % Importance of the true classified samples is decreased for the next weak classifier
    samples_weight(t_labeled) = samples_weight(t_labeled)*...
                    ((error_rate)/(1-error_rate));   %更新样本权重             

    % Normalization
    samples_weight = samples_weight/sum(samples_weight);
end

% Normalization
adaboost_model.weights=adaboost_model.weights/sum(adaboost_model.weights);
end
