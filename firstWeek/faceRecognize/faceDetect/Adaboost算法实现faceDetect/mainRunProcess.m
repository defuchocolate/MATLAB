tic
load('dataSet.mat');%dataSet.mat中含有分类器需要的数据tr_set &te_set &tr_labels &te_labels
tr_n=70;   %tr_n表示训练数据的个数
te_n=20;   %te_n表示测试数据的个数
weak_learner_n=20;  %weak_learner_n表示迭代次数，也就是弱分类器的个数
tr_error=zeros(1,weak_learner_n);%tr_error表示训练数据的分类错误率
te_error=zeros(1,weak_learner_n);%te_error表示测试数据的分类错误率

%________________________________________强分类器的训练______________________________________________%

for i=1:weak_learner_n
    adaboost_model=adaboost_tr(@threshold_tr,@threshold_te,tr_set,tr_labels,i);%利用训练集训练分类器
    [L_tr,hits_tr]=adaboost_te(adaboost_model,@threshold_te,tr_set,tr_labels);%利用训练集对训练的分类器进行测试
    tr_error(i)=(tr_n-hits_tr)/tr_n;%计算训练集的错误率
    [L_te,hits_te]=adaboost_te(adaboost_model,@threshold_te,te_set,te_labels);%利用测试集测试集对训练的分类器进行测试
    te_error(i)=(te_n-hits_te)/te_n;%计算测试集的错误率
end
%______________________________________________________________________________________________________%

%_______________________________________________结果呈现_________________________________________________________%
subplot(1,2,1);
plot(1:weak_learner_n,tr_error);
axis([1,weak_learner_n,0,1]);
title('Training Error');
xlabel('weak classifier number');
ylabel('error rate');
grid on;

subplot(1,2,2);axis square;
plot(1:weak_learner_n,te_error);
axis([1,weak_learner_n,0,1]);
title('Testing Error');
xlabel('weak classifier number');
ylabel('error rate');
grid on;
%—————————————————————————————————————————————————————————%

save Adaboost adaboost_model

toc