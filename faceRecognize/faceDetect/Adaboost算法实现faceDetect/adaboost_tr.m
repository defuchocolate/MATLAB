%������Ҫ����ֱ�׫д��������������һ��Ϊ����adaboostģ�͵�ѵ������������Ϊ���ԵĵĲ��������Ĳ��Ժ���.�������£�
function adaboost_model=adaboost_tr(tr_func_handle,te_func_handle,train_set,labels,no_of_hypothesis) %ѵ������
adaboost_model = struct('weights',zeros(1,no_of_hypothesis),...
                        'parameters',[]); %cell(1,no_of_hypothesis));

sample_n = size(train_set,1);
samples_weight = ones(sample_n,1)/sample_n;%��ʼ��������Ȩ��

for turn=1:no_of_hypothesis
    adaboost_model.parameters{turn} = tr_func_handle(train_set,samples_weight,labels);
    [L,hits,error_rate] = te_func_handle(adaboost_model.parameters{turn},...
                                         train_set,samples_weight,labels);
    if(error_rate==1)
        error_rate=1-eps; %epsΪMATLABĬ����С�������ľ���
    elseif(error_rate==0)
        error_rate=eps;
    end

    % The weight of the turn-th weak classifier
    adaboost_model.weights(turn) = log10((1-error_rate)/error_rate);%����������Ȩ��
    C=likelihood2class(L);
    t_labeled=(C==labels);    % true labeled samples

    % Importance of the true classified samples is decreased for the next weak classifier
    samples_weight(t_labeled) = samples_weight(t_labeled)*...
                    ((error_rate)/(1-error_rate));                

    % Normalization
    samples_weight = samples_weight/sum(samples_weight);
end

% Normalization
adaboost_model.weights=adaboost_model.weights/sum(adaboost_model.weights);
end
