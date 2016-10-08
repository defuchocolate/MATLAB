tic
load('dataSet.mat');%dataSet.mat�к��з�������Ҫ������tr_set &te_set &tr_labels &te_labels
tr_n=70;   %tr_n��ʾѵ�����ݵĸ���
te_n=20;   %te_n��ʾ�������ݵĸ���
weak_learner_n=20;  %weak_learner_n��ʾ����������Ҳ�������������ĸ���
tr_error=zeros(1,weak_learner_n);%tr_error��ʾѵ�����ݵķ��������
te_error=zeros(1,weak_learner_n);%te_error��ʾ�������ݵķ��������

%________________________________________ǿ��������ѵ��______________________________________________%

for i=1:weak_learner_n
    adaboost_model=adaboost_tr(@threshold_tr,@threshold_te,tr_set,tr_labels,i);%����ѵ����ѵ��������
    [L_tr,hits_tr]=adaboost_te(adaboost_model,@threshold_te,tr_set,tr_labels);%����ѵ������ѵ���ķ��������в���
    tr_error(i)=(tr_n-hits_tr)/tr_n;%����ѵ�����Ĵ�����
    [L_te,hits_te]=adaboost_te(adaboost_model,@threshold_te,te_set,te_labels);%���ò��Լ����Լ���ѵ���ķ��������в���
    te_error(i)=(te_n-hits_te)/te_n;%������Լ��Ĵ�����
end
%______________________________________________________________________________________________________%

%_______________________________________________�������_________________________________________________________%
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
%������������������������������������������������������������������������������������������������������������������%

save Adaboost adaboost_model

toc