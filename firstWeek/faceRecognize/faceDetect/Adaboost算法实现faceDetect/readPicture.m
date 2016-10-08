function [] = readPicture( trainfaceNum,trainnonfaceNum,testfaceNum,testnonfaceNum )
%函数功能：生成TrainSet&TestSet数据集。
%输入参数详解：
%             1.trainfaceNum------训练数据中人脸图片的个数     2.trainnonfaceNum------训练数据中非人脸图片的个数
%             3.testfaceNum------测试数据中人脸图片的个数      4.testnonfaceNum------测试数据中非人脸图片的个数 
%输出参数详解：
%             无输出参数，将读取的训练集和测试集图片打包成TrainSet.mat&TestSet.mat文件 

%读取训练集中人脸的图片
for i = 1:trainfaceNum
    trainface{i}=strcat('face',int2str(i)); %trainface是结构体，存放图片的名字
    trainfacename = strcat('F:\faceDetectDatabase\trainSet\faces\',trainface{i},'.bmp');%trainfacename是将要读取的图片的绝对路径
    Trainface1 = imread(trainfacename);%Trainface1是读取的图片的矩阵形式
    if size(Trainface1,3)>1            %判断读取的图片是否为灰度图像，如果否，则将图像转化为灰度图像
       Trainface1=rgb2gray(Trainface1);
    end
    Trainface(:,:,i) = Trainface1; %将转化后的灰度图像，存放到三维矩阵Trainface中
    TrainLabels1(i)=2;             %读取的图像的标签，标签为1，表示是人脸图像，标签为0，表示非人脸图像   
end
%读取训练集中非人脸的图片
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

%读取测试集中人脸的图片
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

%读取测试集中非人脸的图片
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
save TrainSet Trainface Trainnonface TrainLabels  %TrainSet表示训练集，其中包括Trainface&Trainnonface&TrainLabels三个数据
save TestSet Testface Testnonface TestLabels
end

