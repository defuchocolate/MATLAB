tic
load('Adaboost.mat', 'adaboost_model');
I=imread('nonface1.bmp');
%I=rgb2gray(I);
testPic = harr_like(I);
[L_te1,classLabels1]=adaboostUsing(adaboost_model,@thresholdTeUsing,testPic);
disp(classLabels1);
toc