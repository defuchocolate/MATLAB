tic
readPicture(40,30,10,10);
load('TestSet.mat');
load('TrainSet.mat');
%ѵ����������������ֵ
for i=1:40
    trainface(i,:)=harr_like(Trainface(:,:,i));
end

%ѵ�����з�����������ֵ
for i=1:30
    trainnonset(i,:)=harr_like(Trainnonface(:,:,i));
end

%���Լ�������������ֵ
for i=1:10
   testface(i,:)=harr_like(Testface(:,:,i));
end

%���Լ��з�����������ֵ
for i=1:10
    testnonset(i,:)=harr_like(Testnonface(:,:,i));
end
trainset=[trainface;trainnonset];
Testset = [testface;testnonset];

tr_set = trainset;
te_set = Testset;
tr_labels = TrainLabels;
te_labels = TestLabels;

save dataSet tr_set te_set tr_labels te_labels
toc