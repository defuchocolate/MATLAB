    for i=1:10
        trainNameFace{i}=strcat('face',int2str(i));
        trainNameNonFace{i}=strcat('nonface',int2str(i));
    end
    
    for i=1:10
        trainfacefileurl = strcat('E:\faceDetectDatabase\trainSet\faces\',trainNameFace{i},'.bmp');
        trainfacepic=imread(trainfacefileurl);
        trainfacepic=rgb2gray(trainfacepic);
        Trainfacepic(:,:,i)=trainfacepic;
        trainnonfacefileurl = strcat('E:\faceDetectDatabase\trainSet\nonface\',trainNameNonFace{i},'.bmp');
        trainnonfacepic=imread(trainnonfacefileurl);
        trainnonfacepic=rgb2gray(trainnonfacepic);
        Trainnonfacepic(:,:,i)=trainnonfacepic;
    end
    
    save picture  Trainfacepic Trainnonfacepic;