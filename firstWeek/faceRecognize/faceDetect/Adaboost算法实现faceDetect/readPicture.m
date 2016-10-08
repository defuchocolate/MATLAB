function [] = readPicture( trainfaceNum,trainnonfaceNum,testfaceNum,testnonfaceNum )
%�������ܣ�����TrainSet&TestSet���ݼ���
%���������⣺
%             1.trainfaceNum------ѵ������������ͼƬ�ĸ���     2.trainnonfaceNum------ѵ�������з�����ͼƬ�ĸ���
%             3.testfaceNum------��������������ͼƬ�ĸ���      4.testnonfaceNum------���������з�����ͼƬ�ĸ��� 
%���������⣺
%             ���������������ȡ��ѵ�����Ͳ��Լ�ͼƬ�����TrainSet.mat&TestSet.mat�ļ� 

%��ȡѵ������������ͼƬ
for i = 1:trainfaceNum
    trainface{i}=strcat('face',int2str(i)); %trainface�ǽṹ�壬���ͼƬ������
    trainfacename = strcat('F:\faceDetectDatabase\trainSet\faces\',trainface{i},'.bmp');%trainfacename�ǽ�Ҫ��ȡ��ͼƬ�ľ���·��
    Trainface1 = imread(trainfacename);%Trainface1�Ƕ�ȡ��ͼƬ�ľ�����ʽ
    if size(Trainface1,3)>1            %�ж϶�ȡ��ͼƬ�Ƿ�Ϊ�Ҷ�ͼ���������ͼ��ת��Ϊ�Ҷ�ͼ��
       Trainface1=rgb2gray(Trainface1);
    end
    Trainface(:,:,i) = Trainface1; %��ת����ĻҶ�ͼ�񣬴�ŵ���ά����Trainface��
    TrainLabels1(i)=2;             %��ȡ��ͼ��ı�ǩ����ǩΪ1����ʾ������ͼ�񣬱�ǩΪ0����ʾ������ͼ��   
end
%��ȡѵ�����з�������ͼƬ
for i = 1:trainnonfaceNum
    trainnonface{i}=strcat('nonface',int2str(i));
    trainnonfacename = strcat('F:\faceDetectDatabase\trainSet\nonFace\',trainnonface{i},'.bmp');
    Trainnonface1 = imread(trainnonfacename);
    if size(Trainnonface1,3)>1 
       Trainnonface1=rgb2gray(Trainnonface1);
    end
    Trainnonface(:,:,i) = Trainnonface1;
    TrainLabels2(i)=1;
end

%��ȡ���Լ���������ͼƬ
for i = 1:testfaceNum
    testface{i}=strcat('face',int2str(i));
    testfacename = strcat('F:\faceDetectDatabase\testSet\faces\',testface{i},'.bmp');
    testface1 = imread(testfacename);
     if size(testface1,3)>1 
       testface1=rgb2gray(testface1);
     end
    Testface(:,:,i) = testface1;
    TestLabels1(i)=2;
end

%��ȡ���Լ��з�������ͼƬ
for i=1:testnonfaceNum
    testnonface{i}=strcat('nonface',int2str(i));
    testnonfacename = strcat('F:\faceDetectDatabase\testSet\nonFace\',testnonface{i},'.bmp');
    Testnonface1 = imread(testnonfacename);
    if size(Testnonface1,3)>1 
       Testnonface1 =rgb2gray(Testnonface1);
    end
    Testnonface(:,:,i) = Testnonface1;
    TestLabels2(i)=1;
end
TrainLabels=[TrainLabels1 TrainLabels2];
TrainLabels=TrainLabels';
TestLabels=[TestLabels1 TestLabels2];
TestLabels=TestLabels';
save TrainSet Trainface Trainnonface TrainLabels  %TrainSet��ʾѵ���������а���Trainface&Trainnonface&TrainLabels��������
save TestSet Testface Testnonface TestLabels
end

