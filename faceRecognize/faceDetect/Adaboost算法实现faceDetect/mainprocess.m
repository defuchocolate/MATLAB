clear all
clc
tr_n=10;   %the population of the train set
te_n=10;   %the population of the test set
weak_learner_n=20;  %the population of the weak_learner
tr_set=[1,5;2,3;3,2;4,6;4,7;5,9;6,5;6,7;8,5;8,8];
te_set=[1,5;2,3;3,2;4,6;4,7;5,9;6,5;6,7;8,5;8,8];
tr_labels=[2,2,1,1,2,2,1,2,1,1]';
te_labels=[2,2,1,1,2,2,1,2,1,1]';

figure;
subplot(2,2,1);
hold on;axis square;
indices=tr_labels==1;
plot(tr_set(indices,1),tr_set(indices,2),'b*');
indices=~indices;
plot(tr_set(indices,1),tr_set(indices,2),'r*');
title('Training set');
subplot(2,2,2);
hold on;axis square;
indices=te_labels==1;
plot(te_set(indices,1),te_set(indices,2),'b*');
indices=~indices;
plot(te_set(indices,1),te_set(indices,2),'r*');
title('Training set');
% Training and testing error rates
tr_error=zeros(1,weak_learner_n);
te_error=zeros(1,weak_learner_n);
for i=1:weak_learner_n
    adaboost_model=adaboost_tr(@threshold_tr,@threshold_te,tr_set,tr_labels,i);
    [L_tr,hits_tr]=adaboost_te(adaboost_model,@threshold_te,tr_set,tr_labels);
    tr_error(i)=(tr_n-hits_tr)/tr_n;
    [L_te,hits_te]=adaboost_te(adaboost_model,@threshold_te,te_set,te_labels);
    te_error(i)=(te_n-hits_te)/te_n;
end

subplot(2,2,3);
plot(1:weak_learner_n,tr_error);
axis([1,weak_learner_n,0,1]);
title('Training Error');
xlabel('weak classifier number');
ylabel('error rate');
grid on;

subplot(2,2,4);axis square;
plot(1:weak_learner_n,te_error);
axis([1,weak_learner_n,0,1]);
title('Testing Error');
xlabel('weak classifier number');
ylabel('error rate');
grid on;

